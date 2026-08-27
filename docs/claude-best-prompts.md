For coding tasks, ask Claude to run through test cases in its extended thinking

```md
Write a function to calculate the factorial of a number.
Before you finish, please verify your solution with test cases for:
- n=0
- n=1
- n=5
- n=10
And fix any issues you find.
```

# Let claude think
Think step-by-step.

# Use XML tags to structure your prompts

<Note>
  While these tips apply broadly to all Claude models, you can find prompting tips specific to extended thinking models [here](/en/docs/build-with-claude/prompt-engineering/extended-thinking-tips).
</Note>

When your prompts involve multiple components like context, instructions, and examples, XML tags can be a game-changer. They help Claude parse your prompts more accurately, leading to higher-quality outputs.

<Tip>**XML tip**: Use tags like `<instructions>`, `<example>`, and `<formatting>` to clearly separate different parts of your prompt. This prevents Claude from mixing up instructions with examples or context.</Tip>

## Why use XML tags?

* **Clarity:** Clearly separate different parts of your prompt and ensure your prompt is well structured.
* **Accuracy:** Reduce errors caused by Claude misinterpreting parts of your prompt.
* **Flexibility:** Easily find, add, remove, or modify parts of your prompt without rewriting everything.
* **Parseability:** Having Claude use XML tags in its output makes it easier to extract specific parts of its response by post-processing.

<Note>There are no canonical "best" XML tags that Claude has been trained with in particular, although we recommend that your tag names make sense with the information they surround.</Note>

***

## Tagging best practices

1. **Be consistent**: Use the same tag names throughout your prompts, and refer to those tag names when talking about the content (e.g, `Using the contract in <contract> tags...`).
2. **Nest tags**: You should nest tags `<outer><inner></inner></outer>` for hierarchical content.

<Tip>**Power user tip**: Combine XML tags with other techniques like multishot prompting (`<examples>`) or chain of thought (`<thinking>`, `<answer>`). This creates super-structured, high-performance prompts.</Tip>

### Examples

<AccordionGroup>
  <Accordion title="Example: Generating financial reports">
    Without XML tags, Claude misunderstands the task and generates a report that doesn't match the required structure or tone. After substitution, there is also a chance that Claude misunderstands where one section (like the the Q1 report example) stops and another begins.

    | Role      | No XML Tags                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | With XML Tags                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
    | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
    | User      | You're a financial analyst at AcmeCorp. Generate a Q2 financial report for our investors. Include sections on Revenue Growth, Profit Margins, and Cash Flow, like with this example from last year: \{\{Q1\_REPORT}}. Use data points from this spreadsheet: \{\{SPREADSHEET\_DATA}}. The report should be extremely concise, to the point, professional, and in list format. It should and highlight both strengths and areas for improvement.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | You're a financial analyst at AcmeCorp. Generate a Q2 financial report for our investors.<br /><br />AcmeCorp is a B2B SaaS company. Our investors value transparency and actionable insights.<br /><br />Use this data for your report:\<data>\{\{SPREADSHEET\_DATA}}\</data><br /><br />\<instructions><br />1. Include sections: Revenue Growth, Profit Margins, Cash Flow.<br />2. Highlight strengths and areas for improvement.<br />\</instructions><br /><br />Make your tone concise and professional. Follow this structure:<br />\<formatting\_example>\{\{Q1\_REPORT}}\</formatting\_example>                                                                                                                                                                                                                  |
    | Assistant | Q2 Financial Report for AcmeCorp Investors<br /><br />Dear Valued Investors,<br /><br />I am pleased to present our Q2 financial report, showcasing AcmeCorp's continued growth and resilience in the B2B SaaS market.<br /><br />1. Revenue Growth:<br />Our Q2 revenue reached \$15.2M, a 22% YoY increase. This growth is primarily driven by a 30% expansion in our enterprise client base. However, our SMB segment saw a slight decline of 5%, which we aim to address through targeted marketing initiatives in Q3.<br /><br />2. Profit Margins:<br />Gross margin improved to 72% (up 3% from Q1) due to infrastructure optimizations. EBITDA margin, however, dipped to 18% (down 2%) as we invested heavily in R\&D for our upcoming AI-driven features.<br /><br />3. Cash Flow:<br />Operating cash flow remains strong at \$4.1M. Our cash reserves stand at \$28M, providing a 15-month runway at current burn rate. We did see a 20% increase in customer acquisition costs, which we're addressing through more efficient sales strategies.<br /><br />In summary, AcmeCorp's core financials remain robust. We're balancing growth investments with prudent cash management. Our focus for Q3 will be revitalizing SMB growth and optimizing sales efficiency.<br /><br />Thank you for your continued trust.<br /><br />Sincerely,<br />CFO, AcmeCorp | Q2 Financial Report for AcmeCorp Investors\</output><br /><br />Revenue Growth:<br />- Q2 revenue: \$15.2M (22% YoY ↑)<br />- Enterprise clients: 30% ↑<br />- SMB segment: 5% ↓<br />  Action: Targeted Q3 marketing<br /><br />Profit Margins:<br />- Gross margin: 72% (3% ↑ from Q1)<br />  Reason: Infrastructure optimizations<br />- EBITDA margin: 18% (2% ↓)<br />  Reason: R\&D investment in AI features<br /><br />Cash Flow:<br />- Operating cash flow: \$4.1M (strong)<br />- Cash reserves: \$28M (15-month runway)<br />- Customer acquisition cost: 20% ↑<br />  Action: Optimize sales strategies<br /><br />Outlook:<br />- Core financials: Robust<br />- Q3 focus: Revitalize SMB, optimize sales<br /><br />Management remains committed to balancing growth investments with financial discipline. |
  </Accordion>

  <Accordion title="Example: Legal contract analysis">
    Without XML tags, Claude's analysis is disorganized and misses key points. With tags, it provides a structured, thorough analysis that a legal team can act on.

    | Role      | No XML Tags                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | With XML Tags                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
    | --------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
    | User      | Analyze this software licensing agreement for potential risks and liabilities: \{\{CONTRACT}}. Focus on indemnification, limitation of liability, and IP ownership clauses. Also, note any unusual or concerning terms. Here's our standard contract for reference: \{\{STANDARD\_CONTRACT}}. Give a summary of findings and recommendations for our legal team.                                                                                                                                                                                                                                                                                                                    | Analyze this software licensing agreement for legal risks and liabilities.<br /><br />We're a multinational enterprise considering this agreement for our core data infrastructure.<br /><br />\<agreement><br />\{\{CONTRACT}}\</agreement><br /><br />This is our standard contract for reference:<br />\<standard\_contract>\{\{STANDARD\_CONTRACT}}\</standard\_contract><br /><br />\<instructions><br />1. Analyze these clauses:<br />   - Indemnification<br />   - Limitation of liability<br />   - IP ownership<br /><br />2. Note unusual or concerning terms.<br /><br />3. Compare to our standard contract.<br /><br />4. Summarize findings in \<findings> tags.<br /><br />5. List actionable recommendations in \<recommendations> tags.\</instructions>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
    | Assistant | The provided software licensing agreement presents several concerning aspects. The indemnification clause is overly broad, potentially exposing us to significant liabilities. The limitation of liability section caps damages at a mere \$500, which is inadequate for our enterprise-level usage. Regarding IP, the agreement grants the vendor joint ownership of any modifications or integrations we create.<br /><br />In summary, this agreement is not in our best interest. It exposes us to undue risk, limits our recourse in case of failures, and compromises our intellectual property rights. I recommend renegotiating these terms or seeking alternative vendors. | \<findings><br />1. Indemnification (Clause 8):<br />   - Issue: Overly broad. We indemnify vendor against "any and all claims" arising from our use.<br />   - Risk: Could hold us liable even for vendor's negligence or product defects.<br />   - Deviation: Our standard limits indemnity to claims arising from our violation of agreement.<br /><br />2. Limitation of Liability (Clause 9):<br />   - Issue: Caps all damages at \$500, including direct damages.<br />   - Risk: Grossly inadequate for enterprise use. A critical failure could cost millions.<br />   - Deviation: Our standard allows for direct damages up to 12 months of fees paid.<br /><br />3. IP Ownership (Clause 12):<br />   - Issue: Grants vendor joint ownership of our modifications/integrations.<br />   - Risk: Vendor could use or sell our proprietary algorithms or data insights.<br />   - Deviation: Our standard retains full ownership of our work.<br /><br />4. Unusual Terms:<br />   - Clause 5.3: Vendor can use our usage data for "any purpose."<br />   - Clause 7.2: Vendor can terminate for "convenience" with only 7 days' notice.<br />   - Clause 11: No warranties of any kind, even for basic merchantability.<br />\</findings><br /><br />\<recommendations><br />1. Reject this agreement. Risks far outweigh benefits for an enterprise.<br />2. Counter-propose:<br />   - Indemnification: Limit to claims arising from our violation of agreement.<br />   - Liability: Cap at 12 months' fees for direct damages; negotiate for indirect.<br />   - IP: Full ownership of our modifications/integrations.<br />   - Data Use: Restrict to service improvement only.<br />   - Termination: Minimum 90 days' notice; only for cause.<br />   - Warranties: Demand basic merchantability and fitness for purpose.<br />3. If vendor refuses, explore alternative providers or in-house solutions.<br />4. Engage legal counsel for contract negotiation given high stakes.<br />\</recommendations> |
  </Accordion>
</AccordionGroup>

***

<CardGroup cols={3}>
  <Card title="Prompt library" icon="link" href="/en/resources/prompt-library/library">
    Get inspired by a curated selection of prompts for various tasks and use cases.
  </Card>

  <Card title="GitHub prompting tutorial" icon="link" href="https://github.com/anthropics/prompt-eng-interactive-tutorial">
    An example-filled tutorial that covers the prompt engineering concepts found in our docs.
  </Card>

  <Card title="Google Sheets prompting tutorial" icon="link" href="https://docs.google.com/spreadsheets/d/19jzLgRruG9kjUQNKtCg1ZjdD6l6weA6qRXG5zLIAhC8">
    A lighter weight version of our prompt engineering tutorial via an interactive spreadsheet.
  </Card>
</CardGroup>


# Use examples (multishot prompting) to guide Claude's behavior

<Note>
  While these tips apply broadly to all Claude models, you can find prompting tips specific to extended thinking models [here](/en/docs/build-with-claude/prompt-engineering/extended-thinking-tips).
</Note>

Examples are your secret weapon shortcut for getting Claude to generate exactly what you need. By providing a few well-crafted examples in your prompt, you can dramatically improve the accuracy, consistency, and quality of Claude's outputs.
This technique, known as few-shot or multishot prompting, is particularly effective for tasks that require structured outputs or adherence to specific formats.

<Tip>**Power up your prompts**: Include 3-5 diverse, relevant examples to show Claude exactly what you want. More examples = better performance, especially for complex tasks.</Tip>

## Why use examples?

* **Accuracy**: Examples reduce misinterpretation of instructions.
* **Consistency**: Examples enforce uniform structure and style.
* **Performance**: Well-chosen examples boost Claude's ability to handle complex tasks.

## Crafting effective examples

For maximum effectiveness, make sure that your examples are:

* **Relevant**: Your examples mirror your actual use case.
* **Diverse**: Your examples cover edge cases and potential challenges, and vary enough that Claude doesn't inadvertently pick up on unintended patterns.
* **Clear**: Your examples are wrapped in `<example>` tags (if multiple, nested within `<examples>` tags) for structure.

<Tip>Ask Claude to evaluate your examples for relevance, diversity, or clarity. Or have Claude generate more examples based on your initial set.</Tip>

<Accordion title="Example: Analyzing customer feedback">
  Notice that in the "no examples" version, Claude does not list multiple options for each category, despite its written analysis indicating that there are multiple categories for certain feedback. It also includes a long explanation when we may not want it to.

  | Role                          | No Examples                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | With Examples                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
  | ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
  | User                          | Analyze this customer feedback and categorize the issues. Use these categories: UI/UX, Performance, Feature Request, Integration, Pricing, and Other. Also rate the sentiment (Positive/Neutral/Negative) and priority (High/Medium/Low).<br /><br />Here is the feedback: \{\{FEEDBACK}}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | Our CS team is overwhelmed with unstructured feedback. Your task is to analyze feedback and categorize issues for our product and engineering teams. Use these categories: UI/UX, Performance, Feature Request, Integration, Pricing, and Other. Also rate the sentiment (Positive/Neutral/Negative) and priority (High/Medium/Low). Here is an example:<br /><br />\<example><br />Input: The new dashboard is a mess! It takes forever to load, and I can't find the export button. Fix this ASAP!<br />Category: UI/UX, Performance<br />Sentiment: Negative<br />Priority: High\</example><br /><br />Now, analyze this feedback: \{\{FEEDBACK}}                                                                                                                                                                                                                                                                                                                                                                                               |
  | Assistant (Claude's response) | Here's the analysis of the customer feedback:<br /><br />Issue: UI/UX<br />Sentiment: Negative<br />Priority: High<br />The customer is frustrated with the new dashboard design, which they find cluttered and slow to load. They specifically call out the missing "export" button, which is likely a critical feature. This issue needs to be addressed as a high priority.<br /><br />Issue: Integration<br />Sentiment: Positive<br />Priority: Medium<br />The customer is pleased with the existing Salesforce integration but would like to see support for Hubspot as well. This is a feature request that could be considered for a future product update.<br /><br />Issue: Pricing<br />Sentiment: Negative<br />Priority: High<br />The customer finds the pricing to be unreasonable, especially for the basic features. They are threatening to switch to a competitor, so this is a high-priority issue that needs to be reviewed.<br /><br />Issue: Performance<br />Sentiment Negative<br />Priority: High<br />The customer is experiencing critical issues with the mobile app, where large file uploads consistently result in crashes. This is a significant problem that impacts the customer's ability to use the product effectively and should be addressed as a high priority.<br /><br />Issue: UI/UX<br />Sentiment: Positive<br />Priority: Low<br />The customer is overall satisfied with the product, specifically calling out the intuitive UI and excellent customer support. This is a positive piece of feedback that does not require any immediate action. | Here's the analysis of the customer feedback:<br /><br />1. The new dashboard is a mess! It takes forever to load, and I can't find the export button. Fix this ASAP!<br />Category: UI/UX, Performance<br />Sentiment: Negative<br />Priority: High<br /><br />2. Love the Salesforce integration! But it'd be great if you could add Hubspot too.<br />Category: Integration, Feature Request<br />Sentiment: Positive<br />Priority: Medium<br /><br />3. Your pricing is ridiculous! \$99/mo for basic features? I'm switching to Competitor X.<br />Category: Pricing<br />Sentiment: Negative<br />Priority: High<br /><br />4. The mobile app keeps crashing when I try to upload large files (>50MB). This is critical for our field agents.<br />Category: Performance<br />Sentiment: Negative<br />Priority: High<br /><br />5. Overall, I'm happy with the product. The UI is intuitive, and the customer support is top-notch. Keep it up!<br />Category: UI/UX, Other (Customer Support)<br />Sentiment: Positive<br />Priority: Low |
</Accordion>

***

<CardGroup cols={3}>
  <Card title="Prompt library" icon="link" href="/en/resources/prompt-library/library">
    Get inspired by a curated selection of prompts for various tasks and use cases.
  </Card>

  <Card title="GitHub prompting tutorial" icon="link" href="https://github.com/anthropics/prompt-eng-interactive-tutorial">
    An example-filled tutorial that covers the prompt engineering concepts found in our docs.
  </Card>

  <Card title="Google Sheets prompting tutorial" icon="link" href="https://docs.google.com/spreadsheets/d/19jzLgRruG9kjUQNKtCg1ZjdD6l6weA6qRXG5zLIAhC8">
    A lighter weight version of our prompt engineering tutorial via an interactive spreadsheet.
  </Card>
</CardGroup>

# Be clear, direct, and detailed

<Note>
  While these tips apply broadly to all Claude models, you can find prompting tips specific to extended thinking models [here](/en/docs/build-with-claude/prompt-engineering/extended-thinking-tips).
</Note>

When interacting with Claude, think of it as a brilliant but very new employee (with amnesia) who needs explicit instructions. Like any new employee, Claude does not have context on your norms, styles, guidelines, or preferred ways of working.
The more precisely you explain what you want, the better Claude's response will be.

<Tip>**The golden rule of clear prompting**<br />Show your prompt to a colleague, ideally someone who has minimal context on the task, and ask them to follow the instructions. If they're confused, Claude will likely be too.</Tip>

## How to be clear, contextual, and specific

* **Give Claude contextual information:** Just like you might be able to better perform on a task if you knew more context, Claude will perform better if it has more contextual information. Some examples of contextual information:
  * What the task results will be used for
  * What audience the output is meant for
  * What workflow the task is a part of, and where this task belongs in that workflow
  * The end goal of the task, or what a successful task completion looks like
* **Be specific about what you want Claude to do:** For example, if you want Claude to output only code and nothing else, say so.
* **Provide instructions as sequential steps:** Use numbered lists or bullet points to better ensure that Claude carries out the task the exact way you want it to.

### Examples

<AccordionGroup>
  <Accordion title="Example: Anonymizing customer feedback">
    Notice that Claude still makes mistakes in the unclear prompting example, such as leaving in a customer's name.

    | Role                          | Unclear Prompt                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Clear Prompt                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
    | ----------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
    | User                          | Please remove all personally identifiable information from these customer feedback messages: \{\{FEEDBACK\_DATA}}                                                                                                                                                                                                                                                                                                                                                     | Your task is to anonymize customer feedback for our quarterly review.<br /><br />Instructions:<br />1. Replace all customer names with "CUSTOMER\_\[ID]" (e.g., "Jane Doe" → "CUSTOMER\_001").<br />2. Replace email addresses with "EMAIL\_\[ID]@example.com".<br />3. Redact phone numbers as "PHONE\_\[ID]".<br />4. If a message mentions a specific product (e.g., "AcmeCloud"), leave it intact.<br />5. If no PII is found, copy the message verbatim.<br />6. Output only the processed messages, separated by "---".<br /><br />Data to process: \{\{FEEDBACK\_DATA}} |
    | Assistant (Claude's response) | Here are the anonymized customer feedback messages:<br />1. I've been using your software for years, and it's been great. But lately, AcmeCloud has been crashing a lot. Fix it!<br />2. XXX, your customer support rep, was incredibly helpful. He guided me through the whole process. My email is XXX if you want to send a survey.<br />3. I'm John Smith, and I'm not happy. I've been on hold for 2 hours trying to reach someone at XXX. This is unacceptable! | CUSTOMER\_001: I've been using your software for years, and it's been great. But lately, AcmeCloud has been crashing a lot. Fix it!<br />---<br />CUSTOMER\_002: CUSTOMER\_SERVICE\_001, your customer support rep, was incredibly helpful. He guided me through the whole process. My email is [EMAIL\_002@example.com](mailto:EMAIL_002@example.com) if you want to send a survey.<br />---<br />CUSTOMER\_003: I'm CUSTOMER\_003, and I'm not happy. I've been on hold for 2 hours trying to reach someone at PHONE\_001. This is unacceptable!                             |
  </Accordion>

  <Accordion title="Example: Crafting a marketing email campaign">
    Notice that Claude makes up details to fill in the gaps where it lacks context with the vague prompt.

    | Role                          | Vague Prompt                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | Specific Prompt                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
    | ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
    | User                          | Write a marketing email for our new AcmeCloud features.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Your task is to craft a targeted marketing email for our Q3 AcmeCloud feature release.<br /><br />Instructions:<br />1. Write for this target audience: Mid-size tech companies (100-500 employees) upgrading from on-prem to cloud.<br />2. Highlight 3 key new features: advanced data encryption, cross-platform sync, and real-time collaboration.<br />3. Tone: Professional yet approachable. Emphasize security, efficiency, and teamwork.<br />4. Include a clear CTA: Free 30-day trial with priority onboarding.<br />5. Subject line: Under 50 chars, mention "security" and "collaboration".<br />6. Personalization: Use \{\{COMPANY\_NAME}} and \{\{CONTACT\_NAME}} variables.<br /><br />Structure:<br />1. Subject line<br />2. Email body (150-200 words)<br />3. CTA button text                                                                                                                                                                                                                                                                                                                                                        |
    | Assistant (Claude's response) | Here's a draft marketing email for our new features:<br /><br />Subject: Boost Your Business with AcmeCloud's Latest Features<br /><br />Dear Valued Customer,<br /><br />We're excited to introduce three powerful features to AcmeCloud that will revolutionize your workflow:<br /><br />1. Real-Time Collaboration: Work on documents simultaneously with your team. No more version control issues!<br />2. AI-Powered Insights: Make data-driven decisions with AI that analyzes trends and automates tasks.<br />3. Advanced Security Suite: End-to-end encryption, multi-factor auth, and threat detection keep your data safe.<br /><br />Limited Offer: Upgrade now for a 20% first-year discount. Plus, refer a friend for an extra 10% off!<br /><br />Best,<br />The AcmeCloud Team | Subject line: AcmeCloud: Enterprise security meets real-time teamwork<br /><br />Email body:<br />Dear \{\{CONTACT\_NAME}},<br /><br />At \{\{COMPANY\_NAME}}, you're scaling fast and eyeing the cloud. But with growth comes the challenge of keeping data secure while fostering collaboration. That's where AcmeCloud's Q3 release comes in, tailor-made for tech innovators like you.<br /><br />1. Fort Knox for Your Files: Military-grade encryption now safeguards your data, both in motion and at rest. Your intellectual property stays yours, period.<br />2. Sync Without Borders: Windows, Mac, or Linux—AcmeCloud speaks all languages. Unified version control means no more "final\_v2\_REALLY\_FINAL.doc".<br />3. Collaborate at Light Speed: Ditch the attachment ping-pong. Now your devs, designers, and data scientists co-create in real-time, slashing time-to-market.<br /><br />Don't just take our word for it. Experience the AcmeCloud difference with our 30-day trial. And because we know time is your most precious asset, we're throwing in priority onboarding.<br /><br />Elevate Your Team Now - Free 30-Day Trial |
  </Accordion>

  <Accordion title="Example: Incident response">
    Notice that Claude outputs superfluous text and different formating with the vague prompt.

    | Role                          | Vague Prompt                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | Detailed Prompt                                                                                                                                                                                                                                                                                                         |
    | ----------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
    | User                          | Analyze this AcmeCloud outage report and summarize the key points.<br /><br />\{\{REPORT}}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | Analyze this AcmeCloud outage report. Skip the preamble. Keep your response terse and write only the bare bones necessary information. List only:<br />1) Cause<br />2) Duration<br />3) Impacted services<br />4) Number of affected users<br />5) Estimated revenue loss. <br /><br />Here's the report: \{\{REPORT}} |
    | Assistant (Claude's response) | Here's a summary of the key points from the AcmeCloud outage report:<br /><br />On May 15th, a misconfigured load balancer update caused significant traffic routing issues, resulting in a service outage from 09:15 to 13:52 UTC. The 4-hour 37-minute disruption impacted our core file syncing service and admin dashboard, rendering them inaccessible. Additionally, the mobile app experienced partial functionality loss. Approximately 68% of our user base, totaling 1.3 million users, were affected. Based on our Service Level Agreements (SLAs) and average revenue per user, we estimate a financial impact of \$420,000 in service credits and potential customer churn. | 1) Cause: Misconfigured load balancer update<br />2) Duration: 4h 37m (09:15-13:52 UTC, May 15)<br />3) Impacted: Core sync, admin dashboard (down); mobile app (partial)<br />4) Affected users: 1.3M (68% of base)<br />5) Est. revenue loss: \$420,000                                                               |
  </Accordion>
</AccordionGroup>

***

<CardGroup cols={3}>
  <Card title="Prompt library" icon="link" href="/en/resources/prompt-library/library">
    Get inspired by a curated selection of prompts for various tasks and use cases.
  </Card>

  <Card title="GitHub prompting tutorial" icon="link" href="https://github.com/anthropics/prompt-eng-interactive-tutorial">
    An example-filled tutorial that covers the prompt engineering concepts found in our docs.
  </Card>

  <Card title="Google Sheets prompting tutorial" icon="link" href="https://docs.google.com/spreadsheets/d/19jzLgRruG9kjUQNKtCg1ZjdD6l6weA6qRXG5zLIAhC8">
    A lighter weight version of our prompt engineering tutorial via an interactive spreadsheet.
  </Card>
</CardGroup>

# Claude 4 prompt engineering best practices

This guide provides specific prompt engineering techniques for Claude 4 models (Opus 4.1, Opus 4, and Sonnet 4) to help you achieve optimal results in your applications. These models have been trained for more precise instruction following than previous generations of Claude models.

## General principles

### Be explicit with your instructions

Claude 4 models respond well to clear, explicit instructions. Being specific about your desired output can help enhance results. Customers who desire the "above and beyond" behavior from previous Claude models might need to more explicitly request these behaviors with Claude 4.

<Accordion title="Example: Creating an analytics dashboard">
  **Less effective:**

  ```text
  Create an analytics dashboard
  ```

  **More effective:**

  ```text
  Create an analytics dashboard. Include as many relevant features and interactions as possible. Go beyond the basics to create a fully-featured implementation.
  ```
</Accordion>

### Add context to improve performance

Providing context or motivation behind your instructions, such as explaining to Claude why such behavior is important, can help Claude 4 better understand your goals and deliver more targeted responses.

<Accordion title="Example: Formatting preferences">
  **Less effective:**

  ```text
  NEVER use ellipses
  ```

  **More effective:**

  ```text
  Your response will be read aloud by a text-to-speech engine, so never use ellipses since the text-to-speech engine will not know how to pronounce them.
  ```
</Accordion>

Claude is smart enough to generalize from the explanation.

### Be vigilant with examples & details

Claude 4 models pay attention to details and examples as part of instruction following. Ensure that your examples align with the behaviors you want to encourage and minimize behaviors you want to avoid.

## Guidance for specific situations

### Control the format of responses

There are a few ways that we have found to be particularly effective in steering output formatting in Claude 4 models:

1. **Tell Claude what to do instead of what not to do**

   * Instead of: "Do not use markdown in your response"
   * Try: "Your response should be composed of smoothly flowing prose paragraphs."

2. **Use XML format indicators**

   * Try: "Write the prose sections of your response in \<smoothly\_flowing\_prose\_paragraphs> tags."

3. **Match your prompt style to the desired output**

   The formatting style used in your prompt may influence Claude's response style. If you are still experiencing steerability issues with output formatting, we recommend as best as you can matching your prompt style to your desired output style. For example, removing markdown from your prompt can reduce the volume of markdown in the output.

### Leverage thinking & interleaved thinking capabilities

Claude 4 offers thinking capabilities that can be especially helpful for tasks involving reflection after tool use or complex multi-step reasoning. You can guide its initial or interleaved thinking for better results.

```text Example prompt
After receiving tool results, carefully reflect on their quality and determine optimal next steps before proceeding. Use your thinking to plan and iterate based on this new information, and then take the best next action.
```

<Info>
  For more information on thinking capabilities, see [Extended thinking](/en/docs/build-with-claude/extended-thinking).
</Info>

### Optimize parallel tool calling

Claude 4 models excel at parallel tool execution. They have a high success rate in using parallel tool calling without any prompting to do so, but some minor prompting can boost this behavior to \~100% parallel tool use success rate. We have found this prompt to be most effective:

```text Sample prompt for agents
For maximum efficiency, whenever you need to perform multiple independent operations, invoke all relevant tools simultaneously rather than sequentially.
```

### Reduce file creation in agentic coding

Claude 4 models may sometimes create new files for testing and iteration purposes, particularly when working with code. This approach allows Claude to use files, especially python scripts, as a 'temporary scratchpad' before saving its final output. Using temporary files can improve outcomes particularly for agentic coding use cases.

If you'd prefer to minimize net new file creation, you can instruct Claude to clean up after itself:

```text Sample prompt
If you create any temporary new files, scripts, or helper files for iteration, clean up these files by removing them at the end of the task.
```

### Enhance visual and frontend code generation

For frontend code generation, you can steer Claude 4 models to create complex, detailed, and interactive designs by providing explicit encouragement:

```text Sample prompt
Don't hold back. Give it your all.
```

You can also improve Claude's frontend performance in specific areas by providing additional modifiers and details on what to focus on:

* "Include as many relevant features and interactions as possible"
* "Add thoughtful details like hover states, transitions, and micro-interactions"
* "Create an impressive demonstration showcasing web development capabilities"
* "Apply design principles: hierarchy, contrast, balance, and movement"

### Avoid focusing on passing tests and hard-coding

Frontier language models can sometimes focus too heavily on making tests pass at the expense of more general solutions. To prevent this behavior and ensure robust, generalizable solutions:

```text Sample prompt
Please write a high quality, general purpose solution. Implement a solution that works correctly for all valid inputs, not just the test cases. Do not hard-code values or create solutions that only work for specific test inputs. Instead, implement the actual logic that solves the problem generally.

Focus on understanding the problem requirements and implementing the correct algorithm. Tests are there to verify correctness, not to define the solution. Provide a principled implementation that follows best practices and software design principles.

If the task is unreasonable or infeasible, or if any of the tests are incorrect, please tell me. The solution should be robust, maintainable, and extendable.
```

## Migration considerations

When migrating from Sonnet 3.7 to Claude 4:

1. **Be specific about desired behavior**: Consider describing exactly what you'd like to see in the output.

2. **Frame your instructions with modifiers**: Adding modifiers that encourage Claude to increase the quality and detail of its output can help better shape Claude's performance. For example, instead of "Create an analytics dashboard", use "Create an analytics dashboard. Include as many relevant features and interactions as possible. Go beyond the basics to create a fully-featured implementation."

3. **Request specific features explicitly**: Animations and interactive elements should be requested explicitly when desired.

