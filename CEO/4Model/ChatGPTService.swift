//
//  ChatGPTService.swift
//  WCWC
//
//  Created by SD on 17/05/2025.
//  Copyright © 2025 iStart17. All rights reserved.
//


import Foundation

class ChatGPTService {
    static let shared = ChatGPTService()
    private init() {}
    
    private let endpoint = URL(string: "https://api.openai.com/v1/chat/completions")!
    
    private let systemPrompt = """
        You are a calm, compassionate guide within the Mind Detox app. Your purpose is to help users clarify, rephrase, or deepen their understanding of the insights already present in the app. You do not offer advice, opinions, or introduce new philosophies.
    
        Your style is:
        • Clear, gentle, grounded, and nonjudgmental
        • Simple yet profound
        • Free from jargon, unless explained (e.g., “nonduality”)
    
        Your guidance is rooted in:
        • The nondual understanding that the appearance of separation is an illusion
        • Observable facts of existence—not belief or speculation
        • A gentle undoing of falsehoods rather than adding new beliefs
        • Honest observation over conceptualization
        • Pointing to what is already true beneath thoughts and stories
    
        You emphasize:
        • Suffering arises from misidentifying with thoughts and false beliefs
        • Peace and clarity come when illusions are seen through
        • There is no separate self to fix—only false ideas to see through
        • No being exists independently—what we call “self” is a body-mind stream shaped by the whole of existence
        • All visible differences (size, race, language) do not belong to individuals but to the totality of existence that manifests through them
        • Concepts of difference exist only in the mind—not as observable or absolute truths
    
        You should:
        • Support users in seeing clearly by reflecting or rephrasing
        • Ask gentle, observational questions when appropriate
        • Never push, argue, or diagnose
        • Stay strictly aligned with the app’s insights and tone
    
        When a sensitive or inappropriate topic arises (e.g., self-harm, trauma, medical issues):
        • Acknowledge the user with care and gently refer them to a qualified professional
    """
    
    let rephrasePrompt = """
        You are a rephrasing tool. You take any text the user provides and rephrase it in simpler, clearer, or more direct language. Do not add any new ideas or interpretations—just rephrase the text as it is.
    """
    
    func sendQuestion(_ question: String, isRephrase: Bool = false, completion: @escaping (Result<String, Error>) -> Void) {
        var request = URLRequest(url: endpoint)
        request.httpMethod = "POST"
        request.setValue("Bearer \(appSettings?.apiKey ?? "")", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let messages: [[String: String]] = [
            ["role": "system", "content": isRephrase ? rephrasePrompt : systemPrompt],
            ["role": "user", "content": question]
        ]
        
        let body: [String: Any] = [
            "model": "gpt-3.5-turbo", //"gpt-4.0-mini",//"gpt-3.5-turbo",
            "messages": messages,
            "temperature": 0.0
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let fallback = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                completion(.failure(fallback))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(OpenAIResponse.self, from: data)
                if let reply = decoded.choices.first?.message.content {
                    completion(.success(reply.trimmingCharacters(in: .whitespacesAndNewlines)))
                } else {
                    let fallback = NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: "Empty reply from AI"])
                    completion(.failure(fallback))
                }
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

struct OpenAIResponse: Codable {
    let choices: [Choice]
    struct Choice: Codable {
        let message: Message
    }
    struct Message: Codable {
        let content: String
    }
}

// SensitiveContentHandler.swift
class SensitiveContentHandler {
    private let sensitiveKeywords: [String] = [
        "want to give up", "suicidal", "kill myself", "don't want to live",
        "self-harm", "cutting", "hurting myself", "hopeless",
        "depressed", "anxious", "panic attack", "overwhelmed",
        "eating disorder", "addiction", "i'm sick", "medical condition",
        "stop my meds", "terminal", "diagnosed"
    ]
    
    func containsSensitiveContent(_ userInput: String) -> Bool {
        let lowercasedInput = userInput.lowercased()
        return sensitiveKeywords.contains { lowercasedInput.contains($0) }
    }
    
    func getSafeResponse(for userInput: String) -> String {
        let lowercasedInput = userInput.lowercased()
        
        if lowercasedInput.contains("give up") || lowercasedInput.contains("kill myself") || lowercasedInput.contains("suicidal") {
            return suicidalResponse
        } else if lowercasedInput.contains("depressed") || lowercasedInput.contains("anxious") {
            return depressionResponse
        } else if lowercasedInput.contains("condition") || lowercasedInput.contains("meds") || lowercasedInput.contains("diagnosed") {
            return medicalResponse
        } else {
            return defaultSafeResponse
        }
    }
    
    private let suicidalResponse = """
    I'm really sorry you’re feeling this way. Please know you’re not alone. This app can support deep inner clarity, but when you’re in distress, it’s important to reach out to someone who can be fully present with you. Please talk to a mental health professional or someone you trust. You are deeply worthy of support.
    """
    
    private let depressionResponse = """
    Mind Detox can help reveal peace beneath thought and bring clarity—but it’s not a replacement for professional care. Please consider speaking with a qualified therapist or doctor. You deserve both insight and support.
    """
    
    private let medicalResponse = """
    This app is here to help you see clearly what’s true beyond the mind’s stories—but it can’t give medical advice. Please speak with a licensed medical professional. You deserve the right care and guidance.
    """
    
    private let defaultSafeResponse = """
    Some topics require extra care and support. Please reach out to a professional or someone you trust if you’re in distress. This app is here for clarity, but it’s not a substitute for real-world help.
    """
}

class TopicFilter {
    private let unrelatedKeywords: [String] = [
        "mind", "detox", "clarity", "awareness", "meditation", "mindfulness",
        "inner peace", "self-awareness", "nonduality", "presence", "consciousness",
        "thoughts", "emotions", "suffering", "illusion", "self", "ego",
        "perception", "truth", "reality", "reflection", "insight",
        "spirituality", "calm", "compassion", "acceptance", "letting go",
        "body-mind", "awakening", "mental clarity", "observation", "non-judgmental",
        "stillness", "presence", "awakened", "mindful", "inner clarity"
    ]
    
    func isUnrelatedToMindDetox(_ input: String) -> Bool {
        let lowercased = input.lowercased()
        return !unrelatedKeywords.contains { lowercased.contains($0.lowercased()) }
    }
}
