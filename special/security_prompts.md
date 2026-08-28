# security prompts

# security audit general

Please perform a security audit on the following code:
[Paste your code here]

In your audit, please:

1. Identify any potential security vulnerabilities, including but not limited to:
   - Injection flaws (SQL, NoSQL, OS command injection, etc.)
   - Broken authentication
   - Sensitive data exposure
   - XML External Entities (XXE)
   - Broken access control
   - Security misconfigurations
   - Cross-Site Scripting (XSS)
   - Insecure deserialization
   - Using components with known vulnerabilities
   - Insufficient logging & monitoring
2. For each vulnerability found:
   - Explain the potential impact
   - Suggest a fix or mitigation strategy
   - Provide a code snippet demonstrating the fix, if applicable
3. Suggest any general security improvements or best practices that could be applied to this code.
4. Recommend any security-related libraries or tools that could help improve the overall security posture of the application.

This comprehensive prompt usually gives me a solid starting point for hardening my application’s security.

## improve front-end security

Please review the following front-end code for security best practices:
[Paste your front-end code]

Consider aspects such as:

1. Cross-Site Scripting (XSS) prevention
2. Secure handling of sensitive data
3. Protection against Cross-Site Request Forgery (CSRF)
4. Secure communication with back-end APIs

Provide specific recommendations for improving the security of this code, including any relevant libraries or techniques for our front-end framework.

## analyzing potential sql injection vulnerabilities

Please review the following database interaction code for potential SQL injection vulnerabilities:
[Paste your database interaction code]

For each vulnerability found:

1. Explain how it could be exploited
2. Provide a secure alternative implementation
3. Suggest any relevant security libraries or techniques specific to our database system
