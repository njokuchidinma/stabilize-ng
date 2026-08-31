"use client";

interface PaginationProps {
  currentPage: number;
  totalItems: number;
  itemsPerPage: number;
  onPageChange: (page: number) => void;
  itemLabel?: string;
  variant?: 'square' | 'round';
}

export default function Pagination({
  currentPage,
  totalItems,
  itemsPerPage,
  onPageChange,
  itemLabel = 'items',
  variant = 'square',
}: PaginationProps) {
  const totalPages = Math.max(1, Math.ceil(totalItems / itemsPerPage));
  const start = (currentPage - 1) * itemsPerPage + 1;
  const end = Math.min(currentPage * itemsPerPage, totalItems);

  const getPageNumbers = () => {
    const pages: (number | 'ellipsis')[] = [];
    if (totalPages <= 5) {
      for (let i = 1; i <= totalPages; i++) pages.push(i);
    } else {
      pages.push(1);
      if (currentPage > 3) pages.push('ellipsis');
      const rangeStart = Math.max(2, currentPage - 1);
      const rangeEnd = Math.min(totalPages - 1, currentPage + 1);
      for (let i = rangeStart; i <= rangeEnd; i++) pages.push(i);
      if (currentPage < totalPages - 2) pages.push('ellipsis');
      pages.push(totalPages);
    }
    return pages;
  };

  const btnBase = variant === 'round'
    ? 'w-10 h-10'
    : 'w-8 h-8';

  return (
    <div className="p-5 border-t border-gray-100 flex items-center justify-between text-sm text-[#191C1D]">
      <span>
        Showing <strong className="font-extrabold">{start.toLocaleString()}-{end.toLocaleString()}</strong> of{' '}
        {totalItems.toLocaleString()} {itemLabel}
      </span>
      <div className="flex gap-1.5">
        <button
          onClick={() => onPageChange(Math.max(1, currentPage - 1))}
          disabled={currentPage === 1}
          className={`${btnBase} flex items-center justify-center bg-white border border-gray-200 hover:bg-gray-50 transition shadow-sm text-gray-500 disabled:opacity-40 disabled:cursor-not-allowed`}
        >
          &lt;
        </button>

        {getPageNumbers().map((page, i) =>
          page === 'ellipsis' ? (
            <span key={`e-${i}`} className="px-1 text-gray-400 font-bold self-center">...</span>
          ) : (
            <button
              key={page}
              onClick={() => onPageChange(page)}
              className={`${btnBase} flex items-center justify-center font-extrabold transition shadow-sm ${
                page === currentPage
                  ? 'bg-[#006B32] text-white'
                  : 'bg-white border border-gray-200 hover:bg-gray-50 text-gray-600'
              }`}
            >
              {page}
            </button>
          )
        )}

        <button
          onClick={() => onPageChange(Math.min(totalPages, currentPage + 1))}
          disabled={currentPage === totalPages}
          className={`${btnBase} flex items-center justify-center bg-white border border-gray-200 hover:bg-gray-50 transition shadow-sm text-gray-500 disabled:opacity-40 disabled:cursor-not-allowed`}
        >
          &gt;
        </button>
      </div>
    </div>
  );
}
