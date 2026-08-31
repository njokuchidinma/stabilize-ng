"use client";

import { useState, useRef, useEffect } from 'react';
import { ChevronDown } from 'lucide-react';

interface FilterOption {
  label: string;
  value: string;
}

interface FilterDropdownProps {
  label: string;
  options: FilterOption[];
  value: string;
  onChange: (value: string) => void;
  variant?: 'pill' | 'select';
  icon?: React.ReactNode;
}

export default function FilterDropdown({
  label,
  options,
  value,
  onChange,
  variant = 'pill',
  icon,
}: FilterDropdownProps) {
  const [open, setOpen] = useState(false);
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const handleClick = (e: MouseEvent) => {
      if (ref.current && !ref.current.contains(e.target as Node)) setOpen(false);
    };
    document.addEventListener('mousedown', handleClick);
    return () => document.removeEventListener('mousedown', handleClick);
  }, []);

  const selected = options.find((o) => o.value === value);
  const displayLabel = selected ? `${label}: ${selected.label}` : label;

  if (variant === 'select') {
    return (
      <div className="relative">
        <select
          value={value}
          onChange={(e) => onChange(e.target.value)}
          className="w-full bg-[#F8F9FA] border border-gray-200 text-[#191C1D] text-sm font-semibold px-4 py-3 appearance-none focus:outline-none focus:border-[#006B32] pr-10"
        >
          {options.map((o) => (
            <option key={o.value} value={o.value}>{o.label}</option>
          ))}
        </select>
        <ChevronDown size={16} className="absolute right-4 top-1/2 -translate-y-1/2 text-gray-400 pointer-events-none" />
      </div>
    );
  }

  return (
    <div ref={ref} className="relative">
      <button
        onClick={() => setOpen(!open)}
        className="flex items-center gap-2 px-5 py-2.5 bg-white border border-gray-200 text-sm font-semibold text-gray-700 hover:bg-gray-50 transition shadow-sm whitespace-nowrap"
      >
        {icon}
        {displayLabel}
        <ChevronDown size={16} className={`text-gray-400 transition-transform ${open ? 'rotate-180' : ''}`} />
      </button>

      {open && (
        <div className="absolute top-full mt-2 left-0 bg-white border border-gray-200 shadow-lg py-1 z-30 min-w-[180px]">
          {options.map((o) => (
            <button
              key={o.value}
              onClick={() => { onChange(o.value); setOpen(false); }}
              className={`w-full text-left px-4 py-2.5 text-sm font-medium hover:bg-gray-50 transition ${
                o.value === value ? 'text-[#006B32] font-bold bg-[#E6F0EB]/50' : 'text-gray-700'
              }`}
            >
              {o.label}
            </button>
          ))}
        </div>
      )}
    </div>
  );
}
