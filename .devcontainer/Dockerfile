FROM swift:5.9

# Instala dependências úteis
RUN apt-get update && apt-get install -y \
    libssl-dev \
    libsqlite3-dev \
    libz-dev \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Define o diretório padrão de trabalho no container
WORKDIR /workspace