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