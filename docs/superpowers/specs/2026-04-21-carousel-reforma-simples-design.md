# Carrossel de Imagens Reforma Simples

**Data:** 2026-04-21  
**Objetivo:** Substituir o mockup CSS do Reforma Simples por um carrossel das imagens reais (f1.png a f5.png)

## Contexto

O site atual possui um mockup de device criado inteiramente em CSS simulando a interface do app Reforma Simples. O objetivo é substituir essa simulação por imagens reais do aplicativo, mantendo a mesma presença visual e posicionamento na seção de projetos.

## Especificação do Design

### Estrutura Visual
- **Posição:** Exata mesma localização do mockup atual (lado esquerdo da seção projeto)
- **Container:** Mantém `.project-visual reveal d1` para animação de entrada
- **Dimensões:** Proporções similares ao mockup de device (aproximadamente 300px de largura máxima)
- **Rotação:** Transform rotate(-3deg) para dar dinamismo visual

### Funcionalidade do Carrossel
- **Imagens:** f1.png, f2.png, f3.png, f4.png, f5.png (em sequência)
- **Auto-play:** Transição automática a cada 4 segundos
- **Transição:** Fade suave entre imagens (0.5s duration)
- **Controles:** Indicadores pontuais (dots) para navegação manual
- **Interação:** Pause automático no hover para visualização detalhada

### Estética
- **Border-radius:** 24px (simulando tela de device arredondada)
- **Box-shadow:** `0 35px 80px rgba(0,0,0,0.45)` (sombra dramática)
- **Responsividade:** Imagens se ajustam ao container mantendo aspect-ratio
- **Indicadores:** 
  - Posição: Centralizados abaixo do carrossel
  - Estilo: Círculos pequenos (8px)
  - Cores: var(--text-mute) inativo, var(--accent) ativo
  - Hover: Transição suave de cor

### Implementação Técnica

**HTML:**
```html
<div class="project-visual reveal d1">
  <div class="carousel-container">
    <div class="carousel-images">
      <img src="f1.png" alt="Reforma Simples - Tela 1" class="carousel-image active">
      <img src="f2.png" alt="Reforma Simples - Tela 2" class="carousel-image">
      <img src="f3.png" alt="Reforma Simples - Tela 3" class="carousel-image">
      <img src="f4.png" alt="Reforma Simples - Tela 4" class="carousel-image">
      <img src="f5.png" alt="Reforma Simples - Tela 5" class="carousel-image">
    </div>
    <div class="carousel-dots">
      <button class="dot active" data-slide="0"></button>
      <button class="dot" data-slide="1"></button>
      <button class="dot" data-slide="2"></button>
      <button class="dot" data-slide="3"></button>
      <button class="dot" data-slide="4"></button>
    </div>
  </div>
</div>
```

**CSS:**
- Container com position relative para posicionamento absoluto dos elementos
- Imagens com opacity 0/1 para transição fade
- Dots com flexbox centralizado
- Hover states para interatividade
- Animations com CSS transitions

**JavaScript:**
- Auto-play timer com setInterval
- Event listeners nos dots para navegação manual
- Pause/resume no mouse enter/leave
- Função para transição entre slides com fade effect

## Comportamento Responsivo

- **Desktop:** Largura máxima 300px conforme design original
- **Tablet:** Reduz para 250px mantendo proporções
- **Mobile:** Ajusta para 200px com dots menores
- **Aspect ratio:** Mantém proporção das imagens originais

## Integração com Tema

- **Dark theme:** Dots inativos com var(--text-mute), ativo com var(--accent)
- **Light theme:** Mesma lógica com cores adaptadas
- **Shadow:** Mantém a mesma independente do tema
- **Border:** Sutil border com var(--line) para definir contorno

## Remoção do Código Antigo

Substituir completamente a seção do device mockup (linhas ~1370-1500) que inclui:
- Todo o `.device` container
- CSS do `.rs-*` (Reforma Simples mockup styles)
- Manter apenas o caption "tela do app Reforma Simples" ou adaptar para "imagens do app Reforma Simples"

## Critérios de Sucesso

1. ✅ Posicionamento idêntico ao mockup original
2. ✅ Transições suaves e profissionais
3. ✅ Funcionalidade completa (auto-play + manual)
4. ✅ Responsividade em todos dispositivos
5. ✅ Integração harmoniosa com o tema existente
6. ✅ Performance otimizada (sem JavaScript pesado)