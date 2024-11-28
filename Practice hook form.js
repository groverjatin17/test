import React from "react";
import { useForm, Controller } from "react-hook-form";
import ButtonSelect from "./ButtonSelect";

const App = () => {
  const { control, setValue, watch, handleSubmit } = useForm();
  const selectedValue = watch("selection"); // Watch selected value

  const onSubmit = (data) => {
    console.log("Selected value:", data.selection);
  };

  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <Controller
        name="selection"
        control={control}
        defaultValue="" // Initial value
        render={({ field }) => (
          <ButtonSelect
            options={[
              { value: "option1", label: "Option 1" },
              { value: "option2", label: "Option 2" },
              { value: "option3", label: "Option 3" },
            ]}
            name={field.name}
            control={control}
            setValue={setValue}
            selectedValue={field.value}
          />
        )}
      />
      <button type="submit" style={{ marginTop: "20px" }}>
        Submit
      </button>
    </form>
  );
};

export default App;
