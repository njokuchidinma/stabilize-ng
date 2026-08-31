interface StatusBadgeProps {
  status: string;
  variant?: 'pill' | 'dot';
}

const statusColorMap: Record<string, { bg: string; text: string; dot: string }> = {
  active: { bg: 'bg-[#E6F0EB]', text: 'text-[#006B32]', dot: 'bg-[#006B32]' },
  success: { bg: 'bg-[#E6F0EB]', text: 'text-[#006B32]', dot: 'bg-[#006B32]' },
  confirmed: { bg: 'bg-[#E6F0EB]', text: 'text-[#006B32]', dot: 'bg-[#006B32]' },
  completed: { bg: 'bg-[#006B32]', text: 'text-white', dot: 'bg-[#006B32]' },
  pending: { bg: 'bg-[#FDE8D7]', text: 'text-[#8A5100]', dot: 'bg-[#8A5100]' },
  'pending approval': { bg: 'bg-[#F59E0B]', text: 'text-white', dot: 'bg-[#F59E0B]' },
  warning: { bg: 'bg-[#FDE8D7]', text: 'text-[#8A5100]', dot: 'bg-[#8A5100]' },
  reviewing: { bg: 'bg-[#FDE8D7]', text: 'text-[#8A5100]', dot: 'bg-[#8A5100]' },
  suspended: { bg: 'bg-red-50', text: 'text-red-600', dot: 'bg-red-600' },
  draft: { bg: 'bg-gray-100', text: 'text-gray-500', dot: 'bg-gray-400' },
  inactive: { bg: 'bg-gray-100', text: 'text-gray-500', dot: 'bg-gray-400' },
};

export default function StatusBadge({ status, variant = 'pill' }: StatusBadgeProps) {
  const key = status.toLowerCase();
  const colors = statusColorMap[key] ?? { bg: 'bg-gray-100', text: 'text-gray-600', dot: 'bg-gray-400' };

  return (
    <span className={`inline-flex items-center gap-1.5 px-3 py-1.5 text-[10px] font-extrabold tracking-widest uppercase ${colors.bg} ${colors.text}`}>
      {variant === 'dot' && (
        <span className={`w-1.5 h-1.5 rounded-full ${colors.dot}`} />
      )}
      {status}
    </span>
  );
}
