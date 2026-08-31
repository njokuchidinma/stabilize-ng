"use client";

import Modal from './Modal';

interface ConfirmModalProps {
  isOpen: boolean;
  onClose: () => void;
  onConfirm: () => void;
  title: string;
  message: string;
  confirmLabel?: string;
  cancelLabel?: string;
  variant?: 'danger' | 'success' | 'warning';
  children?: React.ReactNode;
}

const variantStyles = {
  danger: 'bg-red-600 hover:bg-red-700 text-white',
  success: 'bg-[#006B32] hover:bg-[#005a2a] text-white',
  warning: 'bg-[#8A5100] hover:bg-[#704200] text-white',
};

export default function ConfirmModal({
  isOpen,
  onClose,
  onConfirm,
  title,
  message,
  confirmLabel = 'Confirm',
  cancelLabel = 'Cancel',
  variant = 'success',
  children,
}: ConfirmModalProps) {
  return (
    <Modal isOpen={isOpen} onClose={onClose} title={title} size="sm">
      <p className="text-sm text-gray-600 leading-relaxed mb-6">{message}</p>
      {children}
      <div className="flex items-center justify-end gap-3 mt-6">
        <button
          onClick={onClose}
          className="px-5 py-2.5 text-sm font-bold text-gray-700 bg-white border border-gray-200 hover:bg-gray-50 transition"
        >
          {cancelLabel}
        </button>
        <button
          onClick={() => { onConfirm(); onClose(); }}
          className={`px-5 py-2.5 text-sm font-bold shadow-sm transition ${variantStyles[variant]}`}
        >
          {confirmLabel}
        </button>
      </div>
    </Modal>
  );
}
