# CLAUDE.md

Este arquivo contém instruções específicas para o assistente Claude ao trabalhar neste projeto.

## Contexto do Projeto

Este é o site pessoal de Giuliano Cardoso - desenvolvedor de software brasileiro. O site é um portfólio moderno que destaca projetos e experiência profissional.

## Funcionalidades Principais

- **Carrossel de Imagens**: Implementação de carrossel para showcase do app "Reforma Simples"
- **Tema Dark/Light**: Sistema de alternância de temas usando CSS custom properties
- **Design Responsivo**: Layout adaptável para desktop, tablet e mobile
- **Acessibilidade**: Implementação WCAG 2.1 AA compliant

## Estrutura do Projeto

```
/
├── index.html              # Arquivo principal do site
├── images/                 # Diretório de imagens
│   ├── f1.png - f5.png    # Screenshots do app Reforma Simples
│   └── outras imagens...
├── docs/
│   └── superpowers/
│       ├── specs/         # Especificações de design
│       └── plans/         # Planos de implementação
└── arquivos de configuração (favicons, manifests, etc.)
```

## Tecnologias Utilizadas

- **HTML5**: Estrutura semântica moderna
- **CSS3**: 
  - CSS Custom Properties para temas
  - Flexbox e Grid para layout
  - Media queries para responsividade
- **JavaScript ES6+**: 
  - Classes para organização
  - Event listeners para interatividade
  - Auto-play e controles manuais do carrossel

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

## Carrossel de Imagens

O carrossel principal substitui o mockup CSS original e apresenta:
- 5 imagens do app Reforma Simples (f1.png - f5.png)
- Auto-play a cada 4 segundos
- Navegação manual via dots
- Pause no hover
- Transições suaves com fade
- Totalmente responsivo e acessível

## Considerações de Acessibilidade

- Todas as imagens possuem alt text descritivo em português
- Dots de navegação têm aria-labels apropriados
- Suporte completo a navegação por teclado
- Estados de foco visíveis
- Contraste adequado em ambos os temas

## Manutenção

- Mantenha consistência com o sistema de temas existente
- Teste em múltiplos browsers antes de commitar
- Valide acessibilidade ao adicionar novos componentes
- Documente mudanças significativas

## Performance

- Imagens pré-carregadas com `<link rel="preload">`
- Transições otimizadas para GPU
- Código JavaScript minificado na produção