# MCP Server Integration with Gemini CLI

This document summarizes the Model Context Protocol (MCP) server integration with the Gemini CLI, which is exactly how Qwen Code's commands work.

## What is an MCP Server?

An MCP server is an application that exposes tools and resources to the Gemini CLI through the Model Context Protocol, acting as a bridge between the Gemini model and external systems like databases, APIs, or custom scripts.

## Core Integration Architecture

The Gemini CLI integrates with MCP servers through a discovery and execution system:

1. **Discovery Layer**: Iterates through configured servers, establishes connections, fetches tool definitions, and registers tools
2. **Execution Layer**: Each MCP tool is wrapped in a `DiscoveredMCPTool` instance that handles confirmation logic, execution, response processing, and connection state

## Supported Transport Mechanisms

- **Stdio Transport**: Spawns a subprocess and communicates via stdin/stdout
- **SSE Transport**: Connects to Server-Sent Events endpoints
- **Streamable HTTP Transport**: Uses HTTP streaming for communication

## Configuration

MCP servers are configured in the `settings.json` file using the `mcpServers` object:

```json
{
  "mcpServers": {
    "serverName": {
      "command": "path/to/server",
      "args": ["--arg1", "value1"],
      "env": {
        "API_KEY": "$MY_API_TOKEN"
      },
      "cwd": "./server-directory",
      "timeout": 30000,
      "trust": false
    }
  }
}
```

### Key Properties:
- `command`|`url`|`httpUrl`: Required transport method
- `args`: Command-line arguments
- `headers`: Custom HTTP headers
- `env`: Environment variables
- `cwd`: Working directory
- `timeout`: Request timeout (default: 600,000ms)
- `trust`: Bypass confirmation prompts (default: false)
- `includeTools`/`excludeTools`: Tool filtering

## OAuth Support

The CLI supports OAuth 2.0 for remote MCP servers with automatic discovery and token management. OAuth requires a local browser for authentication redirects.

## Tool Execution Flow

1. Model generates a FunctionCall
2. Confirmation process (unless server is trusted)
3. Parameter validation and MCP call
4. Response processing for both LLM context and user display

## Rich Content Support

MCP tools can return rich, multi-part content including text, images, audio, and binary data in a single response, which is processed and sent to the model as context.

## MCP Prompts as Slash Commands

MCP servers can expose predefined prompts that can be executed as slash commands in the CLI, creating shortcuts for common workflows.

## Management Commands

The CLI provides commands to manage MCP servers:
- `gemini mcp add`: Add a new server
- `gemini mcp list`: List configured servers
- `gemini mcp remove`: Remove a server

This integration allows extending the Gemini CLI's capabilities to interact with external systems while maintaining security and reliability. Note that this is exactly how Qwen Code's commands work - through the MCP protocol.