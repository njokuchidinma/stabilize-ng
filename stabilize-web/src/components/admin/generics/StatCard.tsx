import React, { ReactNode } from 'react';

interface StatCardProps {
  icon: ReactNode;
  iconBg: string;
  title: string;
  value: string | number;
  trend: string;
  trendColor: string;
}

export default function StatCard({ icon, iconBg, title, value, trend, trendColor }: StatCardProps) {
  return (
    <div className="bg-white p-6 shadow-sm border border-gray-100 flex flex-col justify-between">
      <div className="flex justify-between items-start mb-4">
        <div className={`w-10 h-10 ${iconBg} flex items-center justify-center`}>
          {icon}
        </div>
        <span className={`text-[10px] font-bold ${trendColor}`}>{trend}</span>
      </div>
      <div>
        <p className="text-[10px] font-bold text-gray-500 uppercase tracking-widest mb-1">{title}</p>
        <p className="text-3xl font-extrabold text-[#191C1D]">{value}</p>
      </div>
    </div>
  );
}
