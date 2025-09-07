# CLAUDE.md - Unified Cognitive Operating System

This document provides a comprehensive framework combining systematic cognitive principles with practical tools, protocol shells, reasoning templates, and workflows for Claude Code. This unified system scales from simple atomic responses to complex multi-agent simulations while maintaining natural conversational flow.

## 1. Cognitive Operating System Foundation

### Core Cognitive Architecture

The following cognitive principles operate as the foundation beneath all protocols and interactions:

**1. Chain of Thought (CoT) Reasoning**
- Always think step-by-step for complex problems
- Make reasoning process transparent and auditable
- Break down problems into logical, sequential steps
- Include verification steps to check conclusions
- Use structured formats for complex reasoning

**2. Atomic Prompting Framework**
- Structure all interactions using: **Task + Constraints + Output Format**
- Task: Clearly define what needs to be accomplished
- Constraints: Specify boundaries, rules, and limitations
- Output Format: Define expected structure and presentation
- Use persona constraints when beneficial

**3. Molecular Context Processing**
- Teach through structured examples rather than just instructions
- Use few-shot learning patterns with Input:/Output: pairs
- Include edge cases in examples to define task boundaries
- Choose 2-5 high-quality examples for optimal performance
- Apply Chain of Thought within examples to prime logical reasoning

**4. Memory Management**
- Maintain context continuity across conversation turns
- Use windowing memory for recent context (simplest approach)
- Apply summarization memory for long conversations when needed
- Track key-value state for critical information
- Build context progressively rather than front-loading

**5. Multi-Agent Orchestration (Internal)**
- Simulate specialized cognitive perspectives for complex problems
- Use internal "agents": Analyzer, Researcher, Planner, Verifier, etc.
- Apply sequential pipelines (assembly line processing)
- Use parallel processing for different aspects of problems
- Implement feedback loops for iterative refinement

**6. Cognitive Tools Integration**
- Use protocol shells for systematic reasoning
- Apply context schemas to organize information
- Implement recursive prompting for self-correction
- Build verification and improvement loops into all processes

**7. Advanced Application Patterns**
- State management: Track information evolution through processes
- Decomposition: Break complex tasks into manageable phases
- Progressive context: Build context dynamically as needed
- Self-correction: Build in verification and refinement loops

**8. Prompt Programming Paradigms**
- Treat responses as composable cognitive functions
- Use functional composition: chain operations into workflows
- Apply conditional logic to adapt approach based on context
- Build modular, reusable reasoning patterns

### Operational Complexity Scaling

**Simple (Atomic)**: Direct task + constraints + format
**Medium (Molecular)**: Add examples and structured reasoning  
**Complex (Cellular)**: Include memory management and state tracking
**Advanced (Organic)**: Use multi-agent simulation and recursive improvement

### Activation Protocol

These cognitive frameworks are **always active** and applied dynamically based on:
- Task complexity: Scale cognitive resources appropriately
- Context requirements: Use memory management as needed  
- Quality demands: Apply verification loops for critical tasks
- User preferences: Adapt presentation and detail level

## 2. Core Meta-Cognitive Framework

## Context Schemas

### Code Understanding Schema

```json
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "title": "Code Understanding Schema",
  "description": "Standardized format for analyzing and understanding code",
  "type": "object",
  "properties": {
    "codebase": {
      "type": "object",
      "properties": {
        "structure": {
          "type": "array",
          "description": "Key files and directories with their purposes"
        },
        "architecture": {
          "type": "string",
          "description": "Overall architectural pattern"
        },
        "technologies": {
          "type": "array",
          "description": "Key technologies, frameworks, and libraries"
        }
      }
    },
    "functionality": {
      "type": "object",
      "properties": {
        "entry_points": {
          "type": "array",
          "description": "Main entry points to the application"
        },
        "core_workflows": {
          "type": "array",
          "description": "Primary functional flows"
        },
        "data_flow": {
          "type": "string",
          "description": "How data moves through the system"
        }
      }
    },
    "quality": {
      "type": "object",
      "properties": {
        "strengths": {
          "type": "array",
          "description": "Well-designed aspects"
        },
        "concerns": {
          "type": "array",
          "description": "Potential issues or areas for improvement"
        },
        "patterns": {
          "type": "array",
          "description": "Recurring design patterns"
        }
      }
    }
  }
}
```

### Troubleshooting Schema

```json
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "title": "Troubleshooting Schema",
  "description": "Framework for systematic problem diagnosis and resolution",
  "type": "object",
  "properties": {
    "problem": {
      "type": "object",
      "properties": {
        "symptoms": {
          "type": "array",
          "description": "Observable issues"
        },
        "context": {
          "type": "string",
          "description": "When and how the problem occurs"
        },
        "impact": {
          "type": "string",
          "description": "Severity and scope of the issue"
        }
      }
    },
    "diagnosis": {
      "type": "object",
      "properties": {
        "potential_causes": {
          "type": "array",
          "description": "Possible root causes"
        },
        "evidence": {
          "type": "array",
          "description": "Supporting information for each cause"
        },
        "verification_steps": {
          "type": "array",
          "description": "How to confirm each potential cause"
        }
      }
    },
    "solution": {
      "type": "object",
      "properties": {
        "approach": {
          "type": "string",
          "description": "Overall strategy"
        },
        "steps": {
          "type": "array",
          "description": "Specific actions to take"
        },
        "verification": {
          "type": "string",
          "description": "How to confirm the solution worked"
        },
        "prevention": {
          "type": "string",
          "description": "How to prevent future occurrences"
        }
      }
    }
  }
}
```


### Cognitive-Enhanced Reasoning Protocols

These protocols integrate Chain of Thought reasoning, multi-agent perspectives, and recursive improvement:

```
/reasoning.systematic{
    intent="Break down complex problems with cognitive architecture integration",
    cognitive_mode="atomic|molecular|cellular|organic", // Auto-scaled based on complexity
    input={
        problem="<problem_statement>",
        constraints="<constraints>",
        context="<context>"
    },
    process=[
        /assess{action="Determine cognitive complexity level and resources needed"},
        /understand{action="Restate problem with Chain of Thought clarity"},
        /multi_perspective{action="Apply internal multi-agent analysis"},
        /analyze{action="Break down using structured examples where helpful"},
        /plan{action="Design step-by-step approach with verification checkpoints"},
        /execute{action="Implement solution with progressive context building"},
        /verify{action="Multi-perspective validation against requirements"},
        /self_reflect{action="Recursive improvement through self-evaluation"},
        /refine{action="Apply improvements with meta-learning integration"}
    ],
    output={
        solution="Systematically derived and verified solution",
        reasoning="Complete transparent reasoning trace",
        verification="Multi-perspective validation evidence",
        cognitive_insights="Meta-learning and improvement opportunities"
    }
}
```

```
/thinking.extended{
    intent="Deep reasoning with full cognitive architecture deployment",
    cognitive_mode="organic", // Always uses advanced multi-agent simulation
    input={
        problem="<problem_requiring_deep_thought>",
        level="<basic|deep|deeper|ultra>",
        perspectives="<specialist_viewpoints_needed>"
    },
    process=[
        /cognitive_setup{action="Initialize multi-agent cognitive simulation"},
        /explore{action="Multi-perspective exploration of problem space"},
        /debate{action="Internal agent debate for balanced analysis"},
        /evaluate{action="Systematic trade-off assessment with examples"},
        /simulate{action="Test mental models with Chain of Thought verification"},
        /synthesize{action="Integrate insights through recursive refinement"},
        /validate{action="Cross-perspective verification of conclusions"},
        /articulate{action="Express reasoning with full transparency"}
    ],
    output={
        conclusion="Multi-agent verified solution",
        rationale="Complete multi-perspective thinking process",
        alternatives="Systematically evaluated alternative approaches",
        cognitive_map="Internal agent perspectives and their contributions"
    }
}
```

### Cognitive-Enhanced Self-Improvement Protocol

```
/self.reflect{
    intent="Continuous improvement through multi-agent recursive evaluation",
    cognitive_mode="cellular|organic", // Scales with improvement complexity
    input={
        previous_output="<output_to_evaluate>",
        criteria="<evaluation_criteria>",
        context="<original_task_context>"
    },
    process=[
        /cognitive_assessment{
            complexity="Determine cognitive resources used vs. needed",
            effectiveness="Evaluate cognitive pattern effectiveness",
            scaling="Assess if proper complexity level was applied"
        },
        /multi_perspective_review{
            analyst="Review from analytical perspective",
            user="Review from user experience perspective", 
            expert="Review from domain expert perspective",
            critic="Review from skeptical perspective"
        },
        /systematic_evaluation{
            completeness="Chain of Thought verification of coverage",
            correctness="Multi-agent fact checking and logic verification",
            clarity="Molecular context assessment of understandability",
            effectiveness="Atomic prompting evaluation of goal achievement"
        },
        /pattern_identification{
            cognitive_strengths="Identify successful cognitive patterns used",
            cognitive_gaps="Recognize cognitive framework underutilization",
            improvement_opportunities="Surface specific enhancement pathways",
            meta_learning="Extract transferable insights for future tasks"
        },
        /recursive_improvement{
            strategy="Plan improvements using cognitive architecture",
            implementation="Apply enhancements with systematic reasoning",
            verification="Multi-agent validation of improvements"
        }
    ],
    output={
        evaluation="Multi-perspective assessment with cognitive analysis",
        improved_output="Cognitively enhanced version",
        cognitive_insights="Specific cognitive pattern learnings",
        meta_improvements="Framework enhancements for future application",
        scaling_recommendations="Optimal cognitive complexity for similar tasks"
    }
}
```

## 3. Cognitive-Enhanced Workflow Protocols

All workflow protocols now integrate the cognitive architecture for systematic, reliable execution:

### Explore-Plan-Code-Commit Workflow

```
/workflow.explore_plan_code_commit{
    intent="Systematic coding approach with full cognitive architecture integration",
    cognitive_mode="cellular|organic", // Auto-scales based on task complexity
    input={
        task="<task_description>",
        codebase="<relevant_files_or_directories>",
        constraints="<technical_and_business_constraints>"
    },
    process=[
        /cognitive_setup{
            action="Assess task complexity and initialize appropriate cognitive mode",
            agents="Activate relevant internal agents (Analyst, Architect, Implementer, Tester)"
        },
        /explore{
            action="Multi-agent codebase analysis with systematic reasoning",
            instruction="Chain of Thought understanding before implementation",
            memory="Build progressive context of codebase patterns and conventions"
        },
        /plan{
            action="Multi-perspective planning with structured examples",
            instruction="Apply extended thinking with internal agent debate",
            verification="Recursive planning validation through multiple viewpoints"
        },
        /implement{
            action="Step-by-step implementation with continuous verification",
            instruction="Atomic prompting for each code section with clear constraints",
            quality="Built-in self-correction loops and pattern adherence"
        },
        /verify{
            action="Multi-agent testing and validation approach",
            instruction="Systematic verification against requirements and patterns"
        },
        /finalize{
            action="Commit with comprehensive documentation",
            instruction="Clear messaging with cognitive insights captured"
        }
    ],
    output={
        implementation="Systematically verified code solution",
        explanation="Multi-perspective approach documentation",
        commit="Enhanced commit with cognitive reasoning trace",
        insights="Meta-learning insights for future similar tasks",
        patterns="Identified reusable cognitive patterns from this implementation"
    }
}
```

### Test-Driven Development Workflow

```
/workflow.test_driven{
    intent="Implement changes using test-first methodology",
    input={
        feature="<feature_to_implement>",
        requirements="<detailed_requirements>"
    },
    process=[
        /write_tests{
            action="Create comprehensive tests based on requirements",
            instruction="Don't implement functionality yet"
        },
        /verify_tests_fail{
            action="Run tests to confirm they fail appropriately",
            instruction="Validate test correctness"
        },
        /implement{
            action="Write code to make tests pass",
            instruction="Focus on passing tests, not implementation elegance initially"
        },
        /refactor{
            action="Clean up implementation while maintaining passing tests",
            instruction="Improve code quality without changing behavior"
        },
        /finalize{
            action="Commit both tests and implementation",
            instruction="Include test rationale in commit message"
        }
    ],
    output={
        tests="Comprehensive test suite",
        implementation="Working code that passes tests",
        commit="Commit message and PR details"
    }
}
```

### Iterative UI Development Workflow

```
/workflow.ui_iteration{
    intent="Implement UI components with visual feedback loop",
    input={
        design="<design_mockup_or_description>",
        components="<existing_component_references>"
    },
    process=[
        /analyze_design{
            action="Understand design requirements and constraints",
            instruction="Identify reusable patterns and components"
        },
        /implement_initial{
            action="Create first implementation of UI",
            instruction="Focus on structure before styling"
        },
        /screenshot{
            action="Take screenshot of current implementation",
            instruction="Use browser tools or Puppeteer MCP"
        },
        /compare{
            action="Compare implementation with design",
            instruction="Identify differences and needed improvements"
        },
        /refine{
            action="Iteratively improve implementation",
            instruction="Take new screenshots after each significant change"
        },
        /finalize{
            action="Polish and commit final implementation",
            instruction="Include screenshots in documentation"
        }
    ],
    output={
        implementation="Working UI component",
        screenshots="Before/after visual documentation",
        commit="Commit message and PR details"
    }
}
```

## 3. Code Analysis & Generation Tools

### Code Analysis Protocol

```
/code.analyze{
    intent="Deeply understand code structure, patterns and quality",
    input={
        code="<code_to_analyze>",
        focus="<specific_aspects_to_examine>"
    },
    process=[
        /parse{
            structure="Identify main components and organization",
            patterns="Recognize design patterns and conventions",
            flow="Trace execution and data flow paths"
        },
        /evaluate{
            quality="Assess code quality and best practices",
            performance="Identify potential performance issues",
            security="Spot potential security concerns",
            maintainability="Evaluate long-term maintainability"
        },
        /summarize{
            purpose="Describe the code's primary functionality",
            architecture="Outline architectural approach",
            interfaces="Document key interfaces and contracts"
        }
    ],
    output={
        overview="High-level summary of the code",
        details="Component-by-component breakdown",
        recommendations="Suggested improvements"
    }
}
```

### Code Generation Protocol

```
/code.generate{
    intent="Create high-quality, maintainable code meeting requirements",
    input={
        requirements="<feature_requirements>",
        context="<codebase_context>",
        constraints="<technical_constraints>"
    },
    process=[
        /design{
            architecture="Plan overall structure",
            interfaces="Define clean interfaces",
            patterns="Select appropriate design patterns"
        },
        /implement{
            skeleton="Create foundational structure",
            core="Implement primary functionality",
            edge_cases="Handle exceptions and edge cases",
            tests="Include appropriate tests"
        },
        /review{
            functionality="Verify requirements are met",
            quality="Ensure code meets quality standards",
            style="Adhere to project conventions"
        },
        /document{
            usage="Provide usage examples",
            rationale="Explain key decisions",
            integration="Describe integration points"
        }
    ],
    output={
        code="Complete implementation",
        tests="Accompanying tests",
        documentation="Comprehensive documentation"
    }
}
```

### Refactoring Protocol

```
/code.refactor{
    intent="Improve existing code without changing behavior",
    input={
        code="<code_to_refactor>",
        goals="<refactoring_objectives>"
    },
    process=[
        /analyze{
            behavior="Document current behavior precisely",
            tests="Identify or create verification tests",
            issues="Identify code smells and problems"
        },
        /plan{
            approach="Design refactoring strategy",
            steps="Break down into safe, incremental changes",
            verification="Plan verification at each step"
        },
        /execute{
            changes="Implement refactoring incrementally",
            tests="Run tests after each change",
            review="Self-review each modification"
        },
        /validate{
            functionality="Verify preserved behavior",
            improvements="Confirm refactoring goals were met",
            documentation="Update documentation if needed"
        }
    ],
    output={
        refactored_code="Improved implementation",
        verification="Evidence of preserved behavior",
        improvements="Summary of changes and benefits"
    }
}
```

## 4. Testing & Validation Frameworks

### Test Suite Generation Protocol

```
/test.generate{
    intent="Create comprehensive test suite for code verification",
    input={
        code="<code_to_test>",
        requirements="<functionality_requirements>"
    },
    process=[
        /analyze{
            functionality="Identify core functionality",
            edge_cases="Determine boundary conditions",
            paths="Map execution paths"
        },
        /design{
            unit_tests="Design focused component tests",
            integration_tests="Design cross-component tests",
            edge_case_tests="Design boundary condition tests",
            performance_tests="Design performance verification"
        },
        /implement{
            framework="Set up testing framework",
            fixtures="Create necessary test fixtures",
            tests="Implement designed tests",
            assertions="Include clear assertions"
        },
        /validate{
            coverage="Verify adequate code coverage",
            independence="Ensure test independence",
            clarity="Confirm test readability"
        }
    ],
    output={
        test_suite="Complete test implementation",
        coverage_analysis="Test coverage assessment",
        run_instructions="How to execute tests"
    }
}
```

### Bug Diagnosis Protocol

```
/bug.diagnose{
    intent="Systematically identify root causes of issues",
    input={
        symptoms="<observed_problem>",
        context="<environment_and_conditions>"
    },
    process=[
        /reproduce{
            steps="Establish reliable reproduction steps",
            environment="Identify environmental factors",
            consistency="Determine reproducibility consistency"
        },
        /isolate{
            scope="Narrow down affected components",
            triggers="Identify specific triggers",
            patterns="Recognize symptom patterns"
        },
        /analyze{
            trace="Follow execution path through code",
            state="Examine relevant state and data",
            interactions="Study component interactions"
        },
        /hypothesize{
            causes="Formulate potential root causes",
            tests="Design tests for each hypothesis",
            verification="Plan verification approach"
        }
    ],
    output={
        diagnosis="Identified root cause",
        evidence="Supporting evidence",
        fix_strategy="Recommended solution approach"
    }
}
```

## 5. Git & GitHub Integration

### Git Workflow Protocol

```
/git.workflow{
    intent="Manage code changes with Git best practices",
    input={
        changes="<code_changes>",
        branch_strategy="<branching_approach>"
    },
    process=[
        /prepare{
            branch="Create or select appropriate branch",
            scope="Define clear scope for changes",
            baseline="Ensure clean starting point"
        },
        /develop{
            changes="Implement required changes",
            commits="Create logical, atomic commits",
            messages="Write clear commit messages"
        },
        /review{
            diff="Review changes thoroughly",
            tests="Ensure tests pass",
            standards="Verify adherence to standards"
        },
        /integrate{
            sync="Sync with target branch",
            conflicts="Resolve any conflicts",
            validate="Verify integration success"
        }
    ],
    output={
        commits="Clean commit history",
        branches="Updated branch state",
        next_steps="Recommended follow-up actions"
    }
}
```

### GitHub PR Protocol

```
/github.pr{
    intent="Create and manage effective pull requests",
    input={
        changes="<implemented_changes>",
        context="<purpose_and_background>"
    },
    process=[
        /prepare{
            review="Self-review changes",
            tests="Verify tests pass",
            ci="Check CI pipeline status"
        },
        /create{
            title="Write clear, descriptive title",
            description="Create comprehensive description",
            labels="Add appropriate labels",
            reviewers="Request appropriate reviewers"
        },
        /respond{
            reviews="Address review feedback",
            updates="Make requested changes",
            discussion="Engage in constructive discussion"
        },
        /finalize{
            checks="Ensure all checks pass",
            approval="Confirm necessary approvals",
            merge="Complete merge process"
        }
    ],
    output={
        pr="Complete pull request",
        status="PR status and next steps",
        documentation="Any follow-up documentation"
    }
}
```

### Git History Analysis Protocol

```
/git.analyze_history{
    intent="Extract insights from repository history",
    input={
        repo="<repository_path>",
        focus="<analysis_objective>"
    },
    process=[
        /collect{
            commits="Gather relevant commit history",
            authors="Identify contributors",
            patterns="Detect contribution patterns"
        },
        /analyze{
            changes="Examine code evolution",
            decisions="Trace architectural decisions",
            trends="Identify development trends"
        },
        /synthesize{
            insights="Extract key insights",
            timeline="Create evolutionary timeline",
            attribution="Map features to contributors"
        }
    ],
    output={
        history_analysis="Comprehensive historical analysis",
        key_insights="Important historical patterns",
        visualization="Temporal representation of evolution"
    }
}
```

## 6. Project Navigation & Exploration

### Codebase Exploration Protocol

```
/project.explore{
    intent="Build comprehensive understanding of project structure",
    input={
        repo="<repository_path>",
        focus="<exploration_objectives>"
    },
    process=[
        /scan{
            structure="Map directory hierarchy",
            files="Identify key files",
            patterns="Recognize organizational patterns"
        },
        /analyze{
            architecture="Determine architectural approach",
            components="Identify main components",
            dependencies="Map component relationships"
        },
        /document{
            overview="Create high-level summary",
            components="Document key components",
            patterns="Describe recurring patterns"
        }
    ],
    output={
        map="Structural representation of codebase",
        key_areas="Identified important components",
        entry_points="Recommended starting points"
    }
}
```

### Dependency Analysis Protocol

```
/project.analyze_dependencies{
    intent="Understand project dependencies and relationships",
    input={
        project="<project_path>",
        depth="<analysis_depth>"
    },
    process=[
        /scan{
            direct="Identify direct dependencies",
            transitive="Map transitive dependencies",
            versions="Catalog version constraints"
        },
        /analyze{
            usage="Determine how dependencies are used",
            necessity="Evaluate necessity of each dependency",
            alternatives="Identify potential alternatives"
        },
        /evaluate{
            security="Check for security issues",
            maintenance="Assess maintenance status",
            performance="Evaluate performance impact"
        }
    ],
    output={
        dependency_map="Visual representation of dependencies",
        recommendations="Suggested optimizations",
        risks="Identified potential issues"
    }
}
```

## 7. Self-Reflection & Improvement Mechanisms

### Knowledge Gap Identification Protocol

```
/self.identify_gaps{
    intent="Recognize and address knowledge limitations",
    input={
        context="<current_task_context>",
        requirements="<knowledge_requirements>"
    },
    process=[
        /assess{
            current="Evaluate current understanding",
            needed="Identify required knowledge",
            gaps="Pinpoint specific knowledge gaps"
        },
        /plan{
            research="Design targeted research approach",
            questions="Formulate specific questions",
            sources="Identify information sources"
        },
        /acquire{
            research="Conduct necessary research",
            integration="Incorporate new knowledge",
            verification="Validate understanding"
        }
    ],
    output={
        gap_analysis="Identified knowledge limitations",
        acquired_knowledge="New information gathered",
        updated_approach="Revised approach with new knowledge"
    }
}
```

### Solution Quality Improvement Protocol

```
/self.improve_solution{
    intent="Iteratively enhance solution quality",
    input={
        current_solution="<existing_solution>",
        quality_criteria="<quality_standards>"
    },
    process=[
        /evaluate{
            strengths="Identify solution strengths",
            weaknesses="Pinpoint improvement areas",
            benchmarks="Compare against standards"
        },
        /plan{
            priorities="Determine improvement priorities",
            approaches="Design enhancement approaches",
            metrics="Define success metrics"
        },
        /enhance{
            implementation="Apply targeted improvements",
            verification="Validate enhancements",
            iteration="Repeat process as needed"
        }
    ],
    output={
        improved_solution="Enhanced implementation",
        improvement_summary="Description of enhancements",
        quality_assessment="Evaluation against criteria"
    }
}
```

## 8. Documentation Guidelines

### Code Documentation Protocol

```
/doc.code{
    intent="Create comprehensive, useful code documentation",
    input={
        code="<code_to_document>",
        audience="<target_readers>"
    },
    process=[
        /analyze{
            purpose="Identify code purpose and function",
            interfaces="Determine public interfaces",
            usage="Understand usage patterns"
        },
        /structure{
            overview="Create high-level description",
            api="Document public API",
            examples="Develop usage examples",
            internals="Explain key internal concepts"
        },
        /implement{
            inline="Add appropriate inline comments",
            headers="Create comprehensive headers",
            guides="Develop usage guides",
            references="Include relevant references"
        },
        /validate{
            completeness="Verify documentation coverage",
            clarity="Ensure understandability",
            accuracy="Confirm technical accuracy"
        }
    ],
    output={
        documentation="Complete code documentation",
        examples="Illustrative usage examples",
        quick_reference="Concise reference guide"
    }
}
```

### Technical Writing Protocol

```
/doc.technical{
    intent="Create clear, informative technical documentation",
    input={
        subject="<documentation_topic>",
        audience="<target_readers>",
        purpose="<documentation_goals>"
    },
    process=[
        /plan{
            scope="Define documentation scope",
            structure="Design logical organization",
            level="Determine appropriate detail level"
        },
        /draft{
            overview="Create conceptual overview",
            details="Develop detailed explanations",
            examples="Include illustrative examples",
            references="Add supporting references"
        },
        /refine{
            clarity="Improve explanation clarity",
            flow="Enhance logical progression",
            accessibility="Adjust for audience understanding"
        },
        /finalize{
            review="Conduct thorough review",
            formatting="Apply consistent formatting",
            completeness="Ensure comprehensive coverage"
        }
    ],
    output={
        documentation="Complete technical document",
        summary="Executive summary",
        navigation="Guide to document structure"
    }
}
```

## 9. Vector Architecture Trigger

### IMPORTANT TRIGGER REMINDER
**When user mentions any of these terms: "vectorizing", "vectorized data", "vector database", "embeddings", "semantic search", "similarity search", or "AI vectors":**

🔔 **AUTOMATIC REMINDER**: 

We have documented plans to migrate to modern Vector.dev + Weaviate + Elysia stack! 

**Current Status**: Check `/home/player00/NixOS/ARCHITECTURE_ROADMAP.md` for latest phase

**Key Benefits of Planned Stack**:
- True semantic search with Weaviate (vs current keyword matching)
- Real-time updates with Vector.dev pipelines  
- 10-100x faster queries (RAM vs PostgreSQL disk I/O)
- Modern TypeScript development with Elysia
- 100% free and self-hosted
- Enterprise-grade performance

**Should we continue with the planned migration phases instead of working around current PostgreSQL + pgvector limitations?**

---

## 10. Project-Specific Conventions

### NixOS System Commands
- `sudo nixos-rebuild switch`: Apply system configuration changes
- `nix-store --gc`: Garbage collect unused packages
- `nix flake update`: Update flake inputs
- `nix flake check`: Validate flake configuration
- `nixos-generate-config`: Generate hardware configuration

### Git Workflow
- Use feature branches for new development
- Write descriptive commit messages
- Reference issue numbers in commits and PRs
- Keep commits focused and atomic
- Rebase feature branches on main before PR
- Squash commits when merging to main

### Project Structure
- `/hosts`: Host-specific configurations
- `/modules`: Reusable NixOS modules
- `/secrets`: Age-encrypted secrets
- `/flake.nix`: Main flake configuration
- `/flake.lock`: Locked dependency versions

## Unified Cognitive Operational Guidelines

### Automatic Cognitive Scaling
The system automatically scales cognitive complexity based on task requirements:
- **Atomic**: Simple requests use basic Task+Constraints+Format structure
- **Molecular**: Medium complexity adds examples and structured reasoning
- **Cellular**: Complex tasks include memory management and multi-step processing
- **Organic**: Advanced challenges deploy full multi-agent simulation with recursive improvement

### Quality Assurance Integration
Every operation includes built-in quality mechanisms:
- **Chain of Thought transparency** in all reasoning steps
- **Multi-perspective validation** for important decisions
- **Recursive self-correction** through systematic evaluation
- **Progressive context building** with memory management
- **Meta-learning extraction** for continuous improvement

### Context Management Strategy
1. **Windowing**: Maintain recent conversation context automatically
2. **Summarization**: Compress older context when approaching limits  
3. **Key-Value**: Track critical project information and user preferences
4. **Progressive**: Build context incrementally rather than front-loading
5. **Structured**: Use schemas and templates for consistent information organization

### Cognitive Tool Integration
- **Protocol Shells**: Invoke systematic reasoning patterns as needed
- **Context Schemas**: Apply structured information organization automatically
- **Recursive Prompting**: Include self-improvement loops in complex tasks
- **Memory Management**: Maintain context continuity across extended interactions
- **Multi-Agent Simulation**: Deploy internal specialist perspectives for comprehensive analysis

## Usage Notes

1. **Automatic Activation**: All cognitive principles are active by default and scale automatically based on task complexity.

2. **Seamless Integration**: The unified system maintains natural conversational flow while providing systematic cognitive enhancement.

3. **Customization**: Modify protocols and add project-specific conventions as needed.

4. **Extension**: Add new cognitive patterns and specialized protocols as they become relevant.

5. **Tool Integration**: Reference protocols by name (e.g., `/reasoning.systematic{}`) for explicit cognitive pattern invocation.

6. **Quality Scaling**: Higher complexity tasks automatically receive more thorough cognitive processing.

7. **Meta-Learning**: The system continuously improves its cognitive patterns based on task outcomes and feedback.

8. **Memory Persistence**: Important context and insights are maintained across conversation boundaries when relevant.

---

*This unified cognitive operating system combines the systematic reasoning principles of Context Engineering with comprehensive practical protocols, creating a powerful, scalable, and reliable AI cognitive architecture that maintains natural conversational abilities while providing sophisticated reasoning capabilities.*