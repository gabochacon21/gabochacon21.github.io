$ErrorActionPreference = 'Stop'
if (-not (Test-Path .\package.json)) { Write-Host 'No veo package.json. Entra primero a la carpeta arrecife-ti (cd arrecife-ti).' -ForegroundColor Red; exit 1 }
$utf8 = New-Object System.Text.UTF8Encoding $false
function Save($rel, $text) {
  $p = Join-Path (Get-Location) $rel
  New-Item -ItemType Directory -Force -Path (Split-Path $p) | Out-Null
  [System.IO.File]::WriteAllText($p, $text, $utf8)
  Write-Host "Creado: $rel"
}
Remove-Item -ErrorAction SilentlyContinue .\app\favicon.ico, .\app\page.module.css

Save 'lib/config.ts' @'
export const business = {
  name: "Arrecife",
  suffix: ".ti",
  location: "Jacó, Costa Rica",
  whatsapp: "506XXXXXXXX",
  email: "tucorreo@dominio.com",
  phone: "+506 0000 0000",
};

export const whatsappUrl = `https://wa.me/${business.whatsapp}`;

export const services = [
  { title: "Correo y cuentas seguras", text: "Correo con tu dominio, MFA y permisos ordenados por empleado." },
  { title: "Respaldos", text: "Copias automáticas y probadas para que nada se pierda." },
  { title: "Revisión de seguridad", text: "Contraseñas, accesos, WiFi y antivirus, con informe de riesgos." },
  { title: "Soporte técnico", text: "Computadoras, impresoras y sistemas. Escribinos por WhatsApp." },
  { title: "Páginas web", text: "Sitios rápidos, con WhatsApp y Google Maps, listos para vender." },
  { title: "Capacitación", text: "Tu equipo aprende a detectar phishing y cuidar sus accesos." },
];

export const plans = [
  { name: "Básico", text: "Correo seguro con MFA, respaldos y soporte remoto por WhatsApp.", featured: false },
  { name: "Completo", text: "Todo lo básico, más revisión mensual de accesos, actualizaciones y capacitación.", featured: true },
  { name: "Premium", text: "Todo lo completo, más atención prioritaria, visita mensual y reporte detallado.", featured: false },
];

export const steps = [
  { title: "Revisión gratis", text: "20 minutos en tu negocio: correo, respaldos y accesos." },
  { title: "Informe claro", text: "Una página con los riesgos y cómo corregirlos." },
  { title: "Soporte constante", text: "Nos encargamos cada mes, sin contratos largos." },
];

export const status = [
  "MFA activo en todas las cuentas",
  "Respaldo nocturno completado",
  "Accesos revisados este mes",
  "Equipos actualizados",
];
'@

Save 'components/Logo.tsx' @'
type LogoProps = { size?: number };

export default function Logo({ size = 44 }: LogoProps) {
  return (
    <svg width={size} height={size} viewBox="0 0 40 40" fill="none" role="img" aria-label="Logo Arrecife TI">
      <g stroke="#EDEBF5" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round">
        <path d="M20 37V24" />
        <path d="M20 24 12 16V8" />
        <path d="M20 24 28 16V8" />
        <path d="M20 24V12" />
        <path d="M12 16 6 12.5" />
        <path d="M28 16 34 12.5" />
      </g>
      <g fill="#EDEBF5">
        <circle cx="20" cy="24" r="2.5" />
        <circle cx="12" cy="8" r="2.5" />
        <circle cx="28" cy="8" r="2.5" />
        <circle cx="20" cy="12" r="2.5" />
        <circle cx="6" cy="12.5" r="2.5" />
        <circle cx="34" cy="12.5" r="2.5" />
      </g>
    </svg>
  );
}
'@

Save 'app/icon.svg' @'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 40 40" fill="none" xmlns:c2pa="http://c2pa.org/manifest"><metadata><c2pa:manifest>AAAWgmp1bWIAAAAeanVtZGMycGEAEQAQgAAAqgA4m3EDYzJwYQAAABZcanVtYgAAAEdqdW1kYzJtYQARABCAAACqADibcQN1cm46YzJwYTphYTcyMzVmMy1kM2JjLTQwY2QtYWM3Zi02YWFlZjhhYjUwODMAAAADl2p1bWIAAAApanVtZGMyYXMAEQAQgAAAqgA4m3EDYzJwYS5hc3NlcnRpb25zAAAAALxqdW1iAAAARGp1bWRjYm9yABEAEIAAAKoAOJtxE2MycGEuaW5ncmVkaWVudC52MwAAAAAYYzJzaAq+dvYdcTmjfEmp0iuv7/wAAABwY2JvcqNpZGM6Zm9ybWF0bWltYWdlL3N2Zyt4bWxqaW5zdGFuY2VJRHgseG1wOmlpZDowYzVjZDM1ZS03OTRmLTQyOWMtYjEzNS1lYTlmMjgwZjFmODBscmVsYXRpb25zaGlwaHBhcmVudE9mAAAB4mp1bWIAAABBanVtZGNib3IAEQAQgAAAqgA4m3ETYzJwYS5hY3Rpb25zLnYyAAAAABhjMnNoQEyN0WZHDOfOdb+51y9wwwAAAZljYm9yomdhY3Rpb25zgqJmYWN0aW9ua2MycGEub3BlbmVkanBhcmFtZXRlcnOha2luZ3JlZGllbnRzgaJjdXJseC1zZWxmI2p1bWJmPWMycGEuYXNzZXJ0aW9ucy9jMnBhLmluZ3JlZGllbnQudjNkaGFzaFggxO+xJkkN01ktoii2PTT4vY9OLidXlnaB1Z5IJlNKzEqkZmFjdGlvbngdY29tLmFudGhyb3BpYy5jbGF1ZGUucHJvdmlkZWRqcGFyYW1ldGVyc6F4H2NvbS5hbnRocm9waWMub3JpZ2luLWNvbmZpZGVuY2VndW5rbm93bmtkZXNjcmlwdGlvbnhmQ2xhdWRlIHByb3ZpZGVkIHRoaXMgZmlsZSBhdCB0aGUgcmVxdWVzdCBvZiBhIHVzZXIgYW5kIG1heSBoYXZlIGNyZWF0ZWQgb3IgbW9kaWZpZWQgdGhlIGZpbGUgY29udGVudHMubXNvZnR3YXJlQWdlbnShZG5hbWVmQ2xhdWRlcmFsbEFjdGlvbnNJbmNsdWRlZPUAAADIanVtYgAAAEBqdW1kY2JvcgARABCAAACqADibcRNjMnBhLmhhc2guZGF0YQAAAAAYYzJzaDfTGV5vTcYYIabdvEdo5FoAAACAY2JvcqVjYWxnZnNoYTI1NmNwYWRNAAAAAAAAAAAAAAAAAGRoYXNoWCAjiZa0NhbVrohGJfdW4UFdhyFQyxbt8RDX/P+Vt2J/HGRuYW1lbmp1bWJmIG1hbmlmZXN0amV4Y2x1c2lvbnOBomVzdGFydBiHZmxlbmd0aBkeBAAAAj5qdW1iAAAAJ2p1bWRjMmNsABEAEIAAAKoAOJtxA2MycGEuY2xhaW0udjIAAAACD2Nib3KlY2FsZ2ZzaGEyNTZpc2lnbmF0dXJleE1zZWxmI2p1bWJmPS9jMnBhL3VybjpjMnBhOmFhNzIzNWYzLWQzYmMtNDBjZC1hYzdmLTZhYWVmOGFiNTA4My9jMnBhLnNpZ25hdHVyZWppbnN0YW5jZUlEeCx4bXA6aWlkOmRjYTFiNjkyLTQ1OTMtNDU2NC1iMWY3LTk1ZTc1ZDkyNWIxOHJjcmVhdGVkX2Fzc2VydGlvbnODomN1cmx4LXNlbGYjanVtYmY9YzJwYS5hc3NlcnRpb25zL2MycGEuaW5ncmVkaWVudC52M2RoYXNoWCDE77EmSQ3TWS2iKLY9NPi9j04uJ1eWdoHVnkgmU0rMSqJjdXJseCpzZWxmI2p1bWJmPWMycGEuYXNzZXJ0aW9ucy9jMnBhLmFjdGlvbnMudjJkaGFzaFggwuX72gm3Nl9Yx45K/QlDziUWoDkjqsPzdBt7+F/wzXOiY3VybHgpc2VsZiNqdW1iZj1jMnBhLmFzc2VydGlvbnMvYzJwYS5oYXNoLmRhdGFkaGFzaFgg2NdhFozaZw48SZu+l2V/9Vw2z+83IfhLm5lO13pDXch0Y2xhaW1fZ2VuZXJhdG9yX2luZm+jZG5hbWVvQW50aHJvcGljIEZpbGVzZ3ZlcnNpb25lMS4wLjBrc3BlY1ZlcnNpb25lMi40LjAAABA4anVtYgAAAChqdW1kYzJjcwARABCAAACqADibcQNjMnBhLnNpZ25hdHVyZQAAABAIY2JvctKEWQISogEmGCFZAgowggIGMIIBjaADAgECAhRA5aAK7sI50L64g/oGQgU9Z1UTADAKBggqhkjOPQQDAzBJMRcwFQYDVQQKEw5BbnRocm9waWMsIFBCQzEuMCwGA1UEAxMlQW50aHJvcGljIENvbnRlbnQgQ3JlZGVudGlhbHMgUm9vdCBDQTAeFw0yNjA4MDcxODQzNTZaFw0yODA4MDYxOTQzNTZaMEQxFzAVBgNVBAoTDkFudGhyb3BpYywgUEJDMSkwJwYDVQQDEyBBbnRocm9waWMgQ2xhdWRlIENvbnRlbnQgU2lnbmluZzBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IABJh6CmvLUBgFFNU0vUKlOVtE6djd17L5SuwX0LemFisBM3dkd/3cyjxFA3Qo5S46fX0/ihY0VZ7mfb9KF703t5OjWDBWMA4GA1UdDwEB/wQEAwIHgDAVBgNVHSUEDjAMBgorBgEEAYPoXgIBMAwGA1UdEwEB/wQCMAAwHwYDVR0jBBgwFoAUzlHiBIFOZFsj+OPEz5o+nMHXXMIwCgYIKoZIzj0EAwMDZwAwZAIwMXMdFJ4BetLLVY7ORuE9noqbbAZOZn/aArXyTwFAZfKrPzxF2vPoJNf1+UCdg1XGAjBwX1zd9WGqYkqmL5SFqw1QySjr1zJfpJM9+1rdDwSPLMOPOjKuiXjoU/pUUeG9RwmhY3BhZFkNngAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPZYQIHe22lDyG8d8qqm5o9dOou3FU+oP77x2Pj6VvlqYgP5bHbQPHZu/TAe6foIOFibi1nQs83x9Rizux3eagHm234=</c2pa:manifest></metadata>
<rect width="40" height="40" rx="8" fill="#07060B"/>
<g stroke="#EDEBF5" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
<path d="M20 37V24"/><path d="M20 24 12 16V8"/><path d="M20 24 28 16V8"/><path d="M20 24V12"/><path d="M12 16 6 12.5"/><path d="M28 16 34 12.5"/>
</g>
<g fill="#EDEBF5">
<circle cx="20" cy="24" r="2.5"/><circle cx="12" cy="8" r="2.5"/><circle cx="28" cy="8" r="2.5"/><circle cx="20" cy="12" r="2.5"/><circle cx="6" cy="12.5" r="2.5"/><circle cx="34" cy="12.5" r="2.5"/>
</g>
</svg>
'@

Save 'app/layout.tsx' @'
import type { Metadata } from "next";
import { Space_Grotesk, JetBrains_Mono, Inter } from "next/font/google";
import "./globals.css";

const display = Space_Grotesk({ subsets: ["latin"], weight: ["500", "700"], variable: "--font-display" });
const mono = JetBrains_Mono({ subsets: ["latin"], weight: ["400", "700"], variable: "--font-mono" });
const body = Inter({ subsets: ["latin"], weight: ["400", "500"], variable: "--font-body" });

export const metadata: Metadata = {
  title: "Arrecife TI — Soporte y seguridad para negocios de Jacó",
  description:
    "Correo seguro, respaldos, accesos, soporte técnico y páginas web para negocios de Jacó, Costa Rica.",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="es" className={`${display.variable} ${mono.variable} ${body.variable}`}>
      <body>{children}</body>
    </html>
  );
}
'@

Save 'app/page.tsx' @'
import Logo from "../components/Logo";
import { business, whatsappUrl, services, plans, steps, status } from "../lib/config";

export default function Home() {
  return (
    <>
      <header className="header">
        <div className="brand">
          <Logo />
          <span className="brand-name">
            {business.name.toUpperCase()}
            <span className="accent">{business.suffix}</span>
          </span>
        </div>
        <nav className="nav">
          <a href="#servicios">/servicios</a>
          <a href="#planes">/planes</a>
          <a href="#proceso">/proceso</a>
          <a href={whatsappUrl} className="accent">/contacto</a>
        </nav>
      </header>

      <section className="hero">
        <div className="wrap hero-grid">
          <div className="hero-copy">
            <div className="mono accent">{"// ARRECIFE TI · JACÓ, COSTA RICA"}</div>
            <h1>
              Seguridad y tecnología para negocios que <span className="accent">no se hunden</span>.
            </h1>
            <p className="lead">
              Correo seguro, respaldos, accesos, soporte técnico y páginas web. Todo en manos de un
              ingeniero en sistemas de Jacó.
            </p>
            <div className="actions">
              <a href={whatsappUrl} className="btn btn-primary">Revisión gratis</a>
              <a href="#planes" className="btn btn-ghost">Ver planes</a>
            </div>
          </div>
          <div className="terminal mono">
            <div className="muted">$ arrecife --estado negocio</div>
            {status.map((line) => (
              <div key={line}>
                <span className="accent">[OK]</span> {line}
              </div>
            ))}
            <div className="muted">0 amenazas activas</div>
          </div>
        </div>
      </section>

      <section id="servicios" className="section">
        <div className="wrap">
          <h2>Lo que <span className="accent">hacemos</span></h2>
          <div className="grid">
            {services.map((s, i) => (
              <article key={s.title} className="card">
                <div className="mono accent">{String(i + 1).padStart(2, "0")}</div>
                <h3>{s.title}</h3>
                <p>{s.text}</p>
              </article>
            ))}
          </div>
        </div>
      </section>

      <section id="planes" className="section">
        <div className="wrap">
          <h2>Planes <span className="accent">mensuales</span></h2>
          <div className="grid">
            {plans.map((p) => (
              <article key={p.name} className={p.featured ? "card card-featured" : "card"}>
                <div className="mono accent">{p.name.toUpperCase()}{p.featured ? " · POPULAR" : ""}</div>
                <div className="price">[{p.price}]<span className="muted">/mes</span></div>
                <p>{p.text}</p>
              </article>
            ))}
          </div>
          <p className="mono muted small">Páginas web desde [$300] · Revisión de seguridad desde [$50]</p>
        </div>
      </section>

      <section id="proceso" className="section">
        <div className="wrap">
          <h2>Cómo <span className="accent">trabajamos</span></h2>
          <div className="grid">
            {steps.map((s, i) => (
              <div key={s.title}>
                <div className="step-num mono">{String(i + 1).padStart(2, "0")}</div>
                <h3>{s.title}</h3>
                <p>{s.text}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      <section className="cta">
        <div className="cta-inner">
          <h2>¿Listo para <span className="accent">blindar</span> tu negocio?</h2>
          <p className="lead">Escribinos y coordinamos tu revisión gratuita esta semana.</p>
          <a href={whatsappUrl} className="btn btn-primary">Escribir por WhatsApp</a>
        </div>
      </section>

      <footer className="footer mono">
        <span>ARRECIFE.ti · Jacó, Puntarenas, Costa Rica</span>
        <span>{business.email} · {business.phone}</span>
      </footer>
    </>
  );
}
'@

Save 'app/globals.css' @'
:root {
  --bg: #07060b;
  --panel: #0e0b1a;
  --panel-featured: #14092b;
  --line: #1e1a2e;
  --card-line: #241b40;
  --text: #edebf5;
  --muted: #b9b3cf;
  --dim: #8e86aa;
  --accent: #a78bfa;
  --brand: #7c3aed;
}

* { box-sizing: border-box; }

body {
  margin: 0;
  background: var(--bg);
  color: var(--text);
  font-family: var(--font-body), sans-serif;
  line-height: 1.6;
}

a { color: inherit; text-decoration: none; }
h1, h2, h3 { font-family: var(--font-display), sans-serif; margin: 0; }
p { margin: 0; color: var(--muted); }

.mono { font-family: var(--font-mono), monospace; }
.accent { color: var(--accent); }
.muted { color: var(--dim); }
.small { font-size: 14px; }
.wrap { max-width: 1160px; margin: 0 auto; }

.header {
  padding: 20px 48px;
  display: flex; flex-wrap: wrap; gap: 16px;
  justify-content: space-between; align-items: center;
  border-bottom: 1px solid var(--line);
}
.brand { display: flex; align-items: center; gap: 12px; }
.brand-name { font-family: var(--font-display), sans-serif; font-weight: 700; font-size: 22px; letter-spacing: 0.02em; }
.nav { display: flex; flex-wrap: wrap; gap: 28px; font-family: var(--font-mono), monospace; font-size: 14px; color: var(--muted); }

.hero {
  padding: 96px 48px;
  background: radial-gradient(ellipse 60% 70% at 78% 30%, #2a1459 0%, var(--bg) 70%);
}
.hero-grid { display: flex; flex-wrap: wrap; gap: 56px; align-items: center; }
.hero-copy { flex: 1 1 480px; display: flex; flex-direction: column; gap: 28px; }
.hero h1 { font-size: clamp(38px, 6vw, 60px); line-height: 1.05; }
.lead { font-size: 19px; max-width: 560px; }
.actions { display: flex; flex-wrap: wrap; gap: 16px; }

.btn { display: inline-block; padding: 16px 28px; border-radius: 10px; font-weight: 500; }
.btn-primary { background: var(--brand); color: #fff; }
.btn-ghost { border: 1px solid #4b3a8f; padding: 15px 27px; }
.btn:focus-visible, a:focus-visible { outline: 2px solid var(--accent); outline-offset: 3px; }

.terminal {
  flex: 1 1 360px; background: var(--panel); border: 1px solid #3b2a78;
  border-radius: 14px; padding: 24px; font-size: 14px;
  display: flex; flex-direction: column; gap: 12px;
}

.section { padding: 88px 48px; border-top: 1px solid var(--line); }
.section h2, .cta h2 { font-size: clamp(28px, 4vw, 38px); margin-bottom: 40px; }
.grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 20px; }

.card { background: var(--panel); border: 1px solid var(--card-line); border-radius: 14px; padding: 28px; display: flex; flex-direction: column; gap: 10px; }
.card h3 { font-size: 21px; }
.card-featured { background: var(--panel-featured); border: 2px solid var(--brand); }
.price { font-family: var(--font-display), sans-serif; font-size: 36px; font-weight: 700; }
.price span { font-size: 16px; }
.section .small { margin-top: 24px; }
.step-num { font-size: 32px; font-weight: 700; color: var(--brand); }

.cta {
  padding: 96px 48px; text-align: center; border-top: 1px solid var(--line);
  background: radial-gradient(ellipse 50% 80% at 50% 100%, #2a1459 0%, var(--bg) 70%);
}
.cta-inner { max-width: 680px; margin: 0 auto; display: flex; flex-direction: column; gap: 24px; align-items: center; }
.cta h2 { margin-bottom: 0; }

.footer {
  padding: 24px 48px; border-top: 1px solid var(--line);
  font-size: 13px; color: var(--dim);
  display: flex; flex-wrap: wrap; gap: 12px; justify-content: space-between;
}

@media (max-width: 640px) {
  .header, .hero, .section, .cta, .footer { padding-left: 24px; padding-right: 24px; }
}
'@

Write-Host ''
Write-Host 'Listo. Ahora corre: npm run dev' -ForegroundColor Green