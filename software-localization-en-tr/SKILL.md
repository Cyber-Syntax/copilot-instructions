---
name: software-localization-en-tr
description: Translate software localization files from English to Turkish while preserving exact technical structure and syntax
license: MIT
compatibility: opencode
metadata:
  audience: localization-engineers
  workflow: software-localization
  languages:
    source: en
    target: tr
  supported_formats:
    - xml
    - json
---

## What I do

- Translate user-facing English text into professional Turkish
- Preserve exact file structure and syntax
- Maintain placeholders, variables, escape sequences, and formatting
- Keep localization files production-ready and syntactically valid
- Preserve comments, indentation, hierarchy, and ordering
- Generate Turkish-localized filenames when locale markers exist

---

## Supported Input

- `.xml`
- `.json`
- localization/configuration files
- structured resource files used in:
  - software
  - applications
  - games
  - operating systems
  - APIs
  - UI frameworks

---

## Core Translation Rules

### Translate ONLY User-Facing Text

Translate visible English content into natural, context-aware Turkish.

Do NOT translate:

- keys
- IDs
- XML tags
- XML attributes
- variable names
- constants
- class names
- package names
- commands
- file paths
- URLs
- booleans/null
- code fragments

---

### Preserve Structure Exactly

Maintain:

- file structure
- syntax
- indentation
- ordering
- hierarchy
- empty lines
- comment placement
- encoding
- formatting

The output must remain directly usable without manual correction.

---

### Preserve Placeholders & Variables

Never modify:

- `%s`
- `%d`
- `%1$s`
- `{0}`
- `{name}`
- `{{value}}`
- `${count}`
- `$USERNAME`
- HTML/XML entities
- escape sequences

Example:

Input:

```json
"message": "Hello {username}, you have %d messages"
```

Output:

```json
"message": "Merhaba {username}, %d mesajınız var"
```

---

### Maintain Technical Meaning

Translations must preserve:

- severity
- intent
- warning level
- gameplay terminology
- software terminology
- UI tone
- technical accuracy

Avoid literal or robotic translation.

Prefer natural Turkish localization phrasing used in professional software products.

---

### Preserve Syntax Integrity

Never break:

- quotes
- commas
- brackets
- colons
- unicode sequences
- XML entities
- JSON syntax
- escape characters

Output must remain syntactically valid.

---

## File Naming Rules

Replace English locale identifiers with Turkish equivalents.

Examples:

- `l10_en.xml` → `l10_tr.xml`
- `translation_en.xml` → `translation_tr.xml`
- `messages_en.json` → `messages_tr.json`
- `en.json` → `tr.json`

Preserve all other filename components exactly.

---

## Output Rules

- Output ONLY translated file content
- Do not include explanations
- Do not wrap output in markdown unless requested
- Preserve original formatting as closely as possible
- Ensure the result is production-ready

---

## Examples

### XML

Input:

```xml
<resources>
    <!-- Turbo warnings -->
    <string name="turbo_failure">Catastrophic turbo failure</string>
    <string name="seal_issue">Leaking turbo seals</string>
</resources>
```

Output:

```xml
<resources>
    <!-- Turbo warnings -->
    <string name="turbo_failure">Kritik turbo arızası</string>
    <string name="seal_issue">Turbo keçelerinde sızıntı</string>
</resources>
```

---

### JSON

Input:

```json
{
  "warning": "Engine overheating",
  "pressure": "Low oil pressure"
}
```

Output:

```json
{
  "warning": "Motor aşırı ısınıyor",
  "pressure": "Düşük yağ basıncı"
}
```

---

## When to use me

Use this skill when translating localization resources from English to Turkish for:

- software products
- games
- mobile applications
- web applications
- backend systems
- operating systems
- enterprise platforms

Ask clarifying questions only if:

- file encoding is ambiguous
- multiple localization contexts conflict
- domain-specific terminology requires confirmation
