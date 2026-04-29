import Foundation

//print("Aula 2 de Swift!!")

// Beatriz Pimenta de Camargo

protocol Manutencao {
    var nomeMaquina: String { get }
    var id: Int { get }
    var historicoMaquina: [String] { get }
    
    mutating func realizarManutencao(data: String, statusRegularidade: String) -> Bool
}

struct EquipamentoFisico: Manutencao {
    var nomeMaquina: String
    var id: Int
    var historicoMaquina: [String] = []
    var defeituoso: Bool
    
    mutating func realizarManutencao(data: String, statusRegularidade: String) -> Bool {
        if defeituoso {
            print("Falha na Manutenção \(nomeMaquina) está defeituosa.")
            return false
        }
        historicoMaquina.append("Data: \(data) | Status: \(statusRegularidade)")
        print("Manutenção realizada!")
        return true
    }
}

protocol Aula {
    var nome: String { get }
    var instrutor: String { get }
    var categoria: String { get }
    var descricao: String { get }
}

struct TreinoPersonal: Aula {
    var nome: String
    var instrutor: String
    var categoria: String
    var descricao: String
}

struct TurmaColetiva: Aula {
    var nome: String
    var instrutor: String
    var categoria: String
    var descricao: String
    var capacidadeMax: Int
    var capacidadeMin: Int
    var alunosInscritos: [String] = []
    
    mutating func inscreverAluno(_ aluno: String) -> Bool {
        // Verifica se o aluno já está inscrito
        if alunosInscritos.contains(aluno) {
            print("Aluno já está inscrito nessa turma!")
            return false
        }
        // Verifica se há vagas na turma
        if alunosInscritos.count >= capacidadeMax {
            print("Não há vgas, turmas cheia!")
            return false
        }
        // Caso haja vagas inscreve aulno
        alunosInscritos.append(aluno)
        print("Inscrição realizada")
        return true
    }
}
