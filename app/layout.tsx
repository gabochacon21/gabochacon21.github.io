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