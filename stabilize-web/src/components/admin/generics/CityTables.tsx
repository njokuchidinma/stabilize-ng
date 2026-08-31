import React from 'react';
import { Eye, Edit2 } from 'lucide-react';

interface CityTableRowProps {
  name: string;
  state: string;
  status: string;
  users: string | number;
  artisans: string | number;
  bookings: string | number;
  isReviewing?: boolean;
}

export default function CityTableRow({
  name, state, status, users, artisans, bookings, isReviewing = false
}: CityTableRowProps) {
  return (
    <tr className="border-b border-gray-50 hover:bg-gray-50/50 transition">
      <td className="p-4 pl-6">
        <span className="font-extrabold text-[#191C1D]">{name}</span>
      </td>
      <td className="p-4 text-gray-600 text-sm">{state}</td>
      <td className="p-4">
        {isReviewing ? (
          <span className="inline-flex items-center gap-1.5 px-2.5 py-1 text-[9px] font-extrabold uppercase tracking-wider bg-[#FDE8D7] text-[#8A5100]">
            <span className="w-1.5 h-1.5 rounded-full bg-[#8A5100]"></span> {status}
          </span>
        ) : (
          <span className="inline-flex items-center gap-1.5 px-2.5 py-1 text-[9px] font-extrabold uppercase tracking-wider bg-[#E6F0EB] text-[#006B32]">
            <span className="w-1.5 h-1.5 rounded-full bg-[#006B32]"></span> {status}
          </span>
        )}
      </td>
      <td className="p-4 font-semibold text-[#191C1D]">{users}</td>
      <td className="p-4 font-semibold text-[#191C1D]">{artisans}</td>
      <td className="p-4 font-semibold text-[#191C1D]">{bookings}</td>
      <td className="p-4 pr-6">
        <div className="flex items-center gap-3 text-gray-400">
          <button className="hover:text-[#006B32] transition"><Eye size={18} /></button>
          <button className="hover:text-[#006B32] transition"><Edit2 size={16} /></button>
        </div>
      </td>
    </tr>
  );
}
