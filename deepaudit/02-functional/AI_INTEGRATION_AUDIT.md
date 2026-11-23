# AI Integration Audit

## Observed architecture

The backend has AI routes and routing/discovery services; the public config exposes service availability; compiled UI contains resume and cover-letter suggestion flows. No authorized provider credential was used, so live-provider quality, latency, billing, rate limits and persistence are **BLOCKED**, not passed.

## Confirmed product defect

The cover AI handler receives generated text, calls `setState({letterBody: ...})`, and immediately invokes a save handler that reads `this.state.letterBody`. React class state is asynchronous, so the persisted body can be the previous text. Save lacks comprehensive `catch/finally`, allowing a rejected promise to strand the saving state.

## Required qualification

- deterministic prompt/context unit tests with PII minimization;
- provider timeout, abort, retry and rate-limit tests;
- authorization and per-user quota tests;
- prompt-injection and unsafe-output handling;
- explicit preview/accept/reject/undo state machine;
- persistence round trip proving the accepted text, not stale state;
- telemetry that records provider/model/version/latency without prompts or personal data;
- sandbox and live-provider evidence clearly separated.

No claim is made that the live AI integration works.
