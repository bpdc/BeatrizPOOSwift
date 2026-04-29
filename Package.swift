// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.


import PackageDescription

let package = Package(
    name: "PreparandoAmbiente", // Aqui você deve alterar para o nome do seu repositorio
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "Dia_1"
        ),
        .executableTarget(
            name: "Dia_2"
        ),
        .executableTarget(
            name: "Dia_3"
        ),
        .executableTarget(
            name: "Dia_4"
        ),
        .executableTarget(
            name: "Dia_5"
        ),
    ]
)

//para rodar cada aula, no terminal: swift run <nome da pasta da aula> - Exemplo: swift run Aula_1