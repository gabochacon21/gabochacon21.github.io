import Logo from "../components/Logo";
import { business, whatsappUrl, services, plans, steps, status } from "../lib/config";
import SocialLinks from "../components/SocialLinks";

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
              <p className="lead">
                 Correo seguro, respaldos, accesos, soporte técnico, páginas web y chatbots. Todo en manos de
                 profesionales.
              </p>
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
                
                <p>{p.text}</p>
              </article>
            ))}
          </div>
          
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
        <SocialLinks />
        <span>{business.email} · {business.phone}</span>
      </footer>
    </>
  );
}
