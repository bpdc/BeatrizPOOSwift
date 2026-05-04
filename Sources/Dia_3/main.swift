// Beatriz Pimenta de Camargo

class Academia {
    var nome: String

    private var alunos: [String: Aluno] = [:]         
    private var alunosPorEmail: [String: Aluno] = [:] 
    private var instrutores: [String: Instrutor] = [:] 
    private var equipamentos: [Int: EquipamentoFisico] = [:] 
    private var aulas: [String: any Aula] = [:]
    
    init(nome: String) {
        self.nome = nome
    }   
    func admitirAluno(_ aluno: Aluno) -> Bool {
        if alunos[aluno.matricula] != nil {
            print("Matrícula já cadastrada.")
            return false
        }
        if alunosPorEmail[aluno.email] != nil {
            print("E-mail já cadastrado.")
            return false
        }
        alunos[aluno.matricula] = aluno
        alunosPorEmail[aluno.email] = aluno
        print("Aluno \(aluno.nome) admitido com sucesso!")
        return true
    }
    
    func buscarAluno(matricula: String) -> Aluno? {
        return alunos[matricula]
    }    
    func admitirInstrutor(_ instrutor: Instrutor) -> Bool {
        if instrutores[instrutor.email] != nil {
            print("Instrutor já cadastrado.")
            return false
        }
        instrutores[instrutor.email] = instrutor
        print("Instrutor \(instrutor.nome) admitido com sucesso!")
        return true
    }    
    func adicionarEquipamento(_ equipamento: EquipamentoFisico) {
        equipamentos[equipamento.id] = equipamento
        print("Equipamento \(equipamento.nomeMaquina) adicionado.")
    }
    func realizarManutencaoEmLote(data: String, status: String) -> [EquipamentoFisico] {
        var falhas: [EquipamentoFisico] = []
        
        for id in equipamentos.keys {
            let sucesso = equipamentos[id]!.realizarManutencao(data: data, statusRegularidade: status)
            if !sucesso {
                falhas.append(equipamentos[id]!)
            }
        }
        
        if falhas.isEmpty {
            print("Manutenção Realizada.")
        } else {
            print("\(falhas.count) equipamentos com falha:")
            for eq in falhas {
                print("  - \(eq.nomeMaquina) (id: \(eq.id))")
            }
        }
        
        return falhas
    } 
    func adicionarAula(_ aula: any Aula) {
        aulas[aula.nome] = aula
        print("Aula \(aula.nome) adicionada.")
    }
    func agendarPersonal(matriculaAluno: String, treino: TreinoPersonal) -> Bool {
        guard let aluno = alunos[matriculaAluno] else {
            print("Erro: aluno com matrícula \(matriculaAluno) não encontrado.")
            return false
        }
        
        guard aluno.plano.possuiPersonal else {
            print("Erro: o plano '\(aluno.plano.nome)' de \(aluno.nome) não inclui personal trainer.")
            return false
        }
        
        adicionarAula(treino)
        print("Personal agendado para \(aluno.nome) com \(treino.instrutor)!")
        return true
    }
}
let academia = Academia(nome: "Apple Fit")
let beatriz = Aluno(nome: "Beatriz", email: "bia@email.com", matricula: "001", plano: planoAnual, nivel: .avancado)
let carlos = Aluno(nome: "Carlos", email: "carlos@email.com", matricula: "002", plano: planoMensal, nivel: .iniciante)

academia.admitirAluno(beatriz)
academia.admitirAluno(carlos)
academia.admitirAluno(beatriz)

let instrutor = Instrutor(nome: "Pedro", email: "Pedro23@email.com", especialidade: .musculacao)
academia.admitirInstrutor(instrutor)
var esteira = EquipamentoFisico(nomeMaquina: "Esteira", id: 1, defeituoso: false)
var halteres = EquipamentoFisico(nomeMaquina: "Halteres", id: 2, defeituoso: true)
academia.adicionarEquipamento(esteira)
academia.adicionarEquipamento(halteres)
let falhas = academia.realizarManutencaoEmLote(data: "04/05/2026", status: "Regular")
let treino = TreinoPersonal(nome: "Treino Beatriz", instrutor: "Pedro", categoria: "Musculação", descricao: "Treino de força")

academia.agendarPersonal(matriculaAluno: "001", treino: treino)
academia.agendarPersonal(matriculaAluno: "002", treino: treino) 