import React from "react";

const ButtonSelect = ({ options, name, control, setValue, selectedValue }) => {
  const handleClick = (value) => {
    setValue(name, value); // Update react-hook-form's state
  };

  return (
    <div style={{ display: "flex", gap: "10px" }}>
      {options.map((option) => (
        <button
          key={option.value}
          type="button"
          onClick={() => handleClick(option.value)}
          style={{
            padding: "10px 20px",
            cursor: "pointer",
            backgroundColor: selectedValue === option.value ? "#007BFF" : "#E0E0E0",
            color: selectedValue === option.value ? "#FFF" : "#000",
            border: "1px solid #CCC",
            borderRadius: "5px",
          }}
        >
          {option.label}
        </button>
      ))}
    </div>
  );
};

export default ButtonSelect;
