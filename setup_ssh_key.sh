#!/bin/bash

SSH_DIR="$HOME/.ssh"
KEY_PATH="$SSH_DIR/id_"
KEY_COMMENT=""

echo "🔐 Verificando existência de chave SSH..."

if [ -f "$SSH_DIR/id_rsa" ] || [ -f "$SSH_DIR/id_ed25519" ]; then
    echo "✅ Já existe uma chave SSH em $SSH_DIR"
    exit 0
fi

echo "⚙️  Criando nova chave SSH..."

# Solicita o e-mail associado
read -p "📧 Digite o e-mail para associar à chave SSH: " user_email

# Pergunta sobre o tipo de chave
read -p "💡 Deseja usar o algoritmo moderno ed25519 em vez do tradicional rsa? (s/N): " use_ed25519

if [[ "$use_ed25519" =~ ^[sS]$ ]]; then
    ALGO="ed25519"
    KEY_PATH="${KEY_PATH}ed25519"
    echo "🔧 Usando algoritmo ed25519"
else
    ALGO="rsa"
    KEY_PATH="${KEY_PATH}rsa"
    echo "🔧 Usando algoritmo rsa (4096 bits)"
fi

# Cria o diretório ~/.ssh se não existir
mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

# Gera a chave SSH com base no algoritmo escolhido
if [ "$ALGO" == "rsa" ]; then
    ssh-keygen -t rsa -b 4096 -C "$user_email" -f "$KEY_PATH" -N ""
else
    ssh-keygen -t ed25519 -C "$user_email" -f "$KEY_PATH" -N ""
fi

chmod 600 "$KEY_PATH"
chmod 644 "${KEY_PATH}.pub"

echo "✅ Chave SSH criada com sucesso!"

# Detecta sistema para copiar para clipboard
if command -v pbcopy &> /dev/null; then
    pbcopy < "${KEY_PATH}.pub"
    echo "📋 A chave pública foi copiada para o clipboard (macOS)"
elif command -v xclip &> /dev/null; then
    xclip -selection clipboard < "${KEY_PATH}.pub"
    echo "📋 A chave pública foi copiada para o clipboard (Linux)"
else
    echo "⚠️  Nenhuma ferramenta de cópia para clipboard foi detectada."
fi

# Mostra a chave no terminal
echo
echo "🔑 Sua chave pública SSH:"
cat "${KEY_PATH}.pub"

echo
echo "👉 Agora adicione essa chave à sua conta GitHub/GitLab/etc."
