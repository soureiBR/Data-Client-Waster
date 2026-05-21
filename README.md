# Data Client Waster

Cliente customizado para Google Tag Manager Server-side que atua como mapper entre dados de requisição e dados de evento, oferecendo controle de paths autorizados e configurações flexíveis de resposta.

## 🎯 Objetivo

Esta tag permite:

- **Controlar quais paths** são aceitos pelo servidor GTM (ex: `/data`, `/spec`, `/top`)
- **Mapear dados de requisição** para eventos processáveis pelo container
- **Configurar respostas customizadas** (JSON, redirecionamentos, erros)
- **Gerenciar cookies** com opções de HttpOnly e renovação automática
- **Processar múltiplos eventos** em uma única requisição

## 📋 Funcionalidades Principais

- ✅ Validação de paths autorizados
- ✅ Suporte a múltiplos eventos por requisição  
- ✅ Headers CORS automáticos
- ✅ Gerenciamento avançado de cookies
- ✅ Respostas configuráveis (200, 301, 302, 403, 404)
- ✅ Geração automática de client_id

## 🚀 Uso

1. Importe o template `.tpl` no GTM Server-side
2. Configure os paths aceitos na interface
3. Envie requisições POST/GET para os endpoints configurados
4. Os dados serão automaticamente mapeados para eventos do container

Ideal para implementações que precisam de controle granular sobre quais endpoints são processados pelo servidor GTM.
