# CLAUDE.md

Este arquivo contém instruções específicas para o assistente Claude ao trabalhar neste projeto.

## Contexto do Projeto

Este é o site pessoal de Giuliano Cardoso - desenvolvedor de software brasileiro. O site é um portfólio moderno que destaca projetos e experiência profissional.

## Funcionalidades Principais

- **Seção de Aplicativos**: Três produtos próprios (Reforma Simples, Olha o Bichim!, Constructus), cada um com faixa de capturas de tela, lista de recursos, números e links para site oficial e lojas
- **Tema Dark/Light**: Sistema de alternância de temas usando CSS custom properties
- **Design Responsivo**: Layout adaptável para desktop, tablet e mobile
- **Acessibilidade**: Implementação WCAG 2.1 AA compliant

## Estrutura do Projeto

```
/
├── index.html              # Arquivo principal do site (HTML + CSS + JS inline)
├── images/
│   ├── apps/              # Capturas e ícones dos apps exibidos no site
│   │   ├── rs-1..4.webp   # Reforma Simples
│   │   ├── ob-1..5.webp   # Olha o Bichim!
│   │   ├── ct-1..3.webp   # Constructus
│   │   └── icon-{rs,ob,ct}.png
│   ├── f1.png - f5.png    # Screenshots originais do Reforma Simples (fonte de rs-*.webp)
│   └── outras imagens...
├── docs/
│   └── superpowers/
│       ├── specs/         # Especificações de design
│       └── plans/         # Planos de implementação
└── arquivos de configuração (favicons, manifests, etc.)
```

### Repositórios de origem dos apps

As capturas em `images/apps/` são derivadas dos repositórios dos próprios apps:

| App | Repositório local | Origem das capturas |
| --- | --- | --- |
| Reforma Simples | `~/rf/app` (Cordova) | `images/f*.png` deste repo |
| Olha o Bichim! | `~/rf/capivara_2048` (Flutter) | `android/fastlane/metadata/android/pt-BR/images/` |
| Constructus | `~/rf/constructus` (Flutter) | `design/play/` |

Para atualizar: redimensione para 540px de largura em WebP (`magick origem.png -resize 540x -quality 82 destino.webp`).

## Tecnologias Utilizadas

- **HTML5**: Estrutura semântica moderna
- **CSS3**: 
  - CSS Custom Properties para temas
  - Flexbox e Grid para layout
  - Media queries para responsividade
- **JavaScript ES6+** (mínimo): apenas alternância de tema e `IntersectionObserver` para as animações de entrada

## Padrões de Desenvolvimento

### CSS
- Use CSS custom properties (variáveis) para cores e temas
- Mantenha responsividade com breakpoints: 768px (tablet) e 480px (mobile)
- Prefira animações com `opacity` e `transform` para performance

### JavaScript
- Use classes ES6+ para componentes
- Implemente cleanup adequado para event listeners
- Mantenha acessibilidade com ARIA labels

### Commits
- Use conventional commits (feat:, fix:, docs:, etc.)
- Inclua co-autoria: `Co-Authored-By: Claude Sonnet 4 <noreply@anthropic.com>`

## Faixa de Capturas (`.shots`)

Rolagem horizontal nativa, sem JavaScript: `overflow-x: auto` + `scroll-snap-type: x proximity`.
Cada `.shot` é um `<figure>` com imagem de altura fixa (400px no desktop, 300px no mobile) e legenda.
O contêiner tem `tabindex="0"` e `role="group"` para permitir rolagem pelo teclado com foco visível.
A dica "arraste para ver todas as telas" só aparece abaixo de 880px, onde a faixa de fato transborda.

## Considerações de Acessibilidade

- Todas as imagens possuem alt text descritivo em português
- Faixas de capturas com `role="group"`, `aria-label` e foco por teclado
- Estados de foco visíveis
- Contraste adequado em ambos os temas

## Manutenção

- Mantenha consistência com o sistema de temas existente
- Teste em múltiplos browsers antes de commitar
- Valide acessibilidade ao adicionar novos componentes
- Documente mudanças significativas

## Performance

- Capturas em WebP a 540px de largura, servidas com `loading="lazy"` e `decoding="async"`
- Transições otimizadas para GPU (`opacity` e `transform`)

## Deploy e Publicação

- **URL de Produção**: https://cardoso.work
- **Plataforma**: Cloudflare Pages
- **Build Version**: v3
- **Deploy Automático**: Cada push para o repositório é automaticamente publicado
- **Domínio**: Configurado para usar o domínio personalizado cardoso.work