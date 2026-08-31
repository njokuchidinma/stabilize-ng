"use client";

interface Tab {
  label: string;
  value: string;
}

interface TabBarProps {
  tabs: Tab[];
  activeTab: string;
  onTabChange: (value: string) => void;
}

export default function TabBar({ tabs, activeTab, onTabChange }: TabBarProps) {
  return (
    <div className="flex gap-8 border-b border-gray-200">
      {tabs.map((tab) => (
        <button
          key={tab.value}
          onClick={() => onTabChange(tab.value)}
          className={`pb-3 text-sm font-bold transition ${
            tab.value === activeTab
              ? 'text-[#006B32] border-b-2 border-[#006B32]'
              : 'text-gray-500 hover:text-[#191C1D]'
          }`}
        >
          {tab.label}
        </button>
      ))}
    </div>
  );
}
