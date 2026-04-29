
// Beatriz Pimenta de Camargo

// Nível exp do aluno
enum NivelExperiencia {
    case iniciante
    case intermediario
    case avancado
}

// Modalidades da academia
enum ModalidadeAula {
    case musculacao
    case spinning
    case yoga
    case hotYoga
    case funcional
    case luta
    case pilates
    case jump
}

struct PlanoAcademia {
    var nome: String
    var valorMensalidade: Double
    var possuiPersonal: Bool
    var limiteAulas: Int
    var duracaoMeses: Int
}

// Catálogo planos
let planoMensal = PlanoAcademia(
    nome: "Mensal",
    valorMensalidade: 100,
    possuiPersonal: false,
    limiteAulas: 10,
    duracaoMeses: 1
)

let planoTrimestral = PlanoAcademia(
    nome: "Plano_Trimestral",
    valorMensalidade: 250.0,
    possuiPersonal: false,
    limiteAulas: 20,
    duracaoMeses: 3
)

let planoAnual = PlanoAcademia(
    nome: "Anual",
    valorMensalidade: 500,
    possuiPersonal: true,
    limiteAulas: 999,
    duracaoMeses: 12
)

// Herança
class Pessoa {
    var nome: String
    var email: String
    
    init(nome: String, email: String) {
        self.nome = nome
        self.email = email
    }
    
    func descricao() {
        print("Nome: \(nome) | Email: \(email)")
    }
}

class Aluno: Pessoa {
    var matricula: String
    var plano: PlanoAcademia
    var nivel: NivelExperiencia
    
    init(nome: String, email: String, matricula: String, plano: PlanoAcademia, nivel: NivelExperiencia) {
        self.matricula = matricula
        self.plano = plano
        self.nivel = nivel
        super.init(nome: nome, email: email)
    }
}

class Instrutor: Pessoa {
    var especialidade: ModalidadeAula
    
    init(nome: String, email: String, especialidade: ModalidadeAula) {
        self.especialidade = especialidade
        super.init(nome: nome, email: email)
    }
}