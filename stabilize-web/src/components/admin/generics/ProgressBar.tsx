import React from 'react';

interface ProgressBarProps {
  label: string;
  percentage: number;
}

export default function ProgressBar({ label, percentage }: ProgressBarProps) {
  return (
    <div>
      <div className="flex justify-between items-center mb-2">
        <span className="text-[10px] font-bold text-gray-500 tracking-widest uppercase">
          {label}
        </span>
        <span className="text-xs font-bold text-[#191C1D]">
          {percentage}%
        </span>
      </div>
      <div className="w-full h-2 bg-gray-100 overflow-hidden">
        <div
          className="h-full bg-[#006B32] transition-all duration-500 ease-out"
          style={{ width: `${percentage}%` }}
        ></div>
      </div>
    </div>
  );
}
