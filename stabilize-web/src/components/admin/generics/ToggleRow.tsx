import React from 'react';

interface ToggleRowProps {
  icon: React.ElementType; // Allows passing Lucide icons
  title: string;
  subtitle: string;
  isActive: boolean;
  onToggle?: () => void; // Optional handler for when you add interactivity
}

export default function ToggleRow({ icon: Icon, title, subtitle, isActive, onToggle }: ToggleRowProps) {
  return (
    <div className="flex items-center justify-between bg-white p-4 rounded-none border border-gray-100 shadow-sm">
      <div className="flex items-center gap-4">
        <div className={`w-10 h-10 shadow-sm rounded-none flex items-center justify-center ${isActive ? 'bg-[#E6F0EB] text-[#006B32]' : 'bg-gray-100 text-gray-400'}`}>
          <Icon size={18} />
        </div>
        <div>
          <p className={`font-bold text-sm ${isActive ? 'text-[#191C1D]' : 'text-gray-400'}`}>
            {title}
          </p>
          <p className={`text-xs ${isActive ? 'text-gray-500' : 'text-gray-400'}`}>
            {subtitle}
          </p>
        </div>
      </div>

      {/* Custom Tailwind Toggle */}
      <div
        onClick={onToggle}
        className={`w-12 h-6 rounded-full p-1 transition-colors duration-300 ease-in-out cursor-pointer ${isActive ? 'bg-[#006B32]' : 'bg-gray-200'}`}
      >
        <div className={`w-4 h-4 bg-white rounded-full shadow-sm transition-transform duration-300 ease-in-out ${isActive ? 'translate-x-6' : 'translate-x-0'}`}></div>
      </div>
    </div>
  );
}