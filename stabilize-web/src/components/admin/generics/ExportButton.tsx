"use client";

import { Download } from 'lucide-react';

interface ExportButtonProps {
  label?: string;
  onClick: () => void;
  variant?: 'primary' | 'secondary';
}

export default function ExportButton({
  label = 'Export CSV',
  onClick,
  variant = 'secondary',
}: ExportButtonProps) {
  const styles = variant === 'primary'
    ? 'text-white bg-[#006B32] hover:bg-[#005a2a]'
    : 'text-gray-700 bg-white border border-gray-200 hover:bg-gray-50';

  return (
    <button
      onClick={onClick}
      className={`flex items-center gap-2 text-sm font-bold px-4 py-2.5 transition shadow-sm whitespace-nowrap ${styles}`}
    >
      <Download size={14} /> {label}
    </button>
  );
}
