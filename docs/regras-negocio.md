# 🎯 Regras de Negócio

## Parceria (ONGs)

- Cada ONG deve possuir um CNPJ único.
- Somente ONGs aprovadas no sistema podem receber doações.
- Deve conter informações de contato, categoria e descrição para transparência.

## Usuário

- Deve possuir um ID único.
- Deve ter um nome cadastrado (não precisa ser único).
- O e-mail deve ser único.
- Deve cadastrar uma senha para login.

## Doador

- Pode optar por ser anônimo (sem CPF ou CNPJ), mas deve fornecer ao menos um e-mail ou telefone.
- Pode realizar doações únicas ou configurar doações recorrentes.
- Pode escolher entre doar para uma campanha específica ou diretamente para uma ONG.

## Campanha

- Cada campanha pertence a uma única ONG.
- Deve conter uma meta de arrecadação.
- Deve ter um prazo de início e fim.
- Somente campanhas ativas podem receber doações.

## Doação

- Apenas usuários cadastrados podem realizar doações identificadas.
- O doador pode escolher entre os métodos de pagamento: Pix, Cartão ou Boleto.
- O valor da doação é registrado junto com a data e método de pagamento.

## Pagamento

- Cada pagamento está vinculado a uma doação.
- Deve possuir um código de transação único.
- Possui um status que pode ser: Pendente, Aprovado ou Recusado.

## Relatório de Transparência

- Apenas ONGs podem publicar relatórios.
- Deve descrever como os fundos foram utilizados.
- Deve conter o total gasto e a data da publicação.

## Avaliação

- Somente usuários que realizaram uma doação podem avaliar uma ONG.
- A nota deve ser um valor entre 1 e 5.
- Usuários podem adicionar um comentário opcional.
- A avaliação fica visível para outros usuários.

## 📊 Tipos de Dados no Sistema

### 1️⃣ Dados Numéricos (Inteiros e Decimais)

**Inteiros (INT)**

- `id_usuario`, `id_ong`, `id_campanha`, `id_doacao`, `id_pagamento`, `id_relatorio`, `id_avaliacao` (Identificadores únicos)
- `nota` (avaliação de 1 a 5)

**Decimais (DECIMAL(10,2))**

- `meta_arrecadacao` (meta de arrecadação da campanha)
- `valor` (valor da doação)
- `total_gasto` (relatório de transparência)

### 2️⃣ Dados Textuais (Strings e ENUMs)

**Strings (VARCHAR, TEXT)**

- **VARCHAR (dados curtos)**

  - `nome` (usuário, ONG)
  - `email` (usuário, único)
  - `senha` (usuário)
  - `cnpj` (ONG, único)
  - `contato` (ONG)
  - `titulo` (campanha)
  - `codigo_transacao` (pagamento, único)

- **TEXT (dados longos)**
  - `descricao` (ONG, campanha, relatório de transparência)
  - `comentario` (avaliação)

**ENUM (Valores Fixos)**

- `metodo_pagamento` ('Pix', 'Cartão', 'Boleto')
- `status` ('Pendente', 'Aprovado', 'Recusado')

### 3️⃣ Dados Temporais (Datas e Horários)

**DATE (Data Sem Horário)**

- `data_cadastro` (usuário)
- `data_inicio` (campanha)
- `data_fim` (campanha)
- `data_publicacao` (relatório)

**DATETIME (Data e Hora)**

- `data_doacao` (registro da doação)
- `data_pagamento` (pagamento processado)
- `data_avaliacao` (avaliação feita pelo usuário)
