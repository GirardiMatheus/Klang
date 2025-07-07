<div align="center">
  <h1>
    <img src=https://img.pokemondb.net/sprites/x-y/normal/klang.png width="40" height="40" alt="Klang" style="vertical-align: middle;">
    Klang
  </h1>
  <p>Script Interativo para Geração de Chaves SSH</p>
  
  <p>
    <img src="https://img.shields.io/badge/Shell_Script-100%25-brightgreen" alt="Shell">
    <img src="https://img.shields.io/badge/SSH-Keygen-4CAF50" alt="SSH Keygen">
    <img src="https://img.shields.io/badge/license-MIT-blue" alt="License">
  </p>
</div>

## Visão Geral

**Klang** é um script simples, interativo e portátil que facilita a criação de chaves SSH em novas máquinas (Linux ou macOS). Ideal para desenvolvedores e administradores que precisam configurar rapidamente acesso a repositórios Git ou servidores remotos.

## Funcionalidades Principais

**Geração de Chaves SSH Automatizada**  
- Escolha entre algoritmos `RSA (4096)` e `ED25519`  
- Comentário personalizado com seu e-mail  
- Permissões seguras e padronizadas  
- Geração silenciosa, sem prompts extras

**Cópia para o Clipboard (quando possível)**  
- Suporte ao `pbcopy` (macOS) e `xclip` (Linux)  
- Exibe a chave pública no terminal para uso imediato

**Portabilidade**  
- Compatível com Ubuntu/Debian/macOS  
- Sem dependências externas obrigatórias

## Pré-requisitos

- Bash 4.0+  
- Para cópia automática da chave pública (opcional):  
  - `pbcopy` no macOS  
  - `xclip` no Linux

## Instalação Rápida

1. Clone o repositório:

```bash
git clone https://github.com/GirardiMatheus/klang.git && cd klang
```

2. Torne o script executável:

```bash
chmod +x setup_ssh_key.sh
```

## Como Usar

**Execução interativa:**

```bash
./setup_ssh_key.sh
```

Você será guiado por perguntas para escolher o algoritmo da chave (`RSA` ou `ED25519`) e informar seu e-mail. O script cuida do resto!

## Estrutura do Projeto

```bash
klang/
├── setup_ssh_key.sh      # Script principal
└── README.md             # Esta documentação
```

## Exemplos

**Geração de chave RSA padrão:**

```bash
./setup_ssh_key.sh
# Escolha: rsa
```

**Geração de chave ED25519 moderna:**

```bash
./setup_ssh_key.sh
# Escolha: ed25519
```

## Boas Práticas

- Guarde sua **chave privada com segurança** (nunca envie para ninguém).
- Adicione sua chave pública aos serviços que utilizar (GitHub, GitLab, servidores, etc).
- Considere usar senha na chave se for usá-la em dispositivos móveis ou menos seguros.

## Contribuição

1. Faça um fork do projeto  
2. Crie sua branch (`git checkout -b feature/nova-funcionalidade`)  
3. Commit suas mudanças (`git commit -am 'Add nova funcionalidade'`)  
4. Push para sua branch (`git push origin feature/nova-funcionalidade`)  
5. Abra um Pull Request

---

<div align="center">
  <strong>🔐 Klang: Segurança começa com boas chaves.</strong>
</div>
