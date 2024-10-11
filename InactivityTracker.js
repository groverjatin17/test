import React, { useState, useEffect } from "react";
import { addMinutes, differenceInSeconds } from "date-fns";
import { formatAutosaveTime } from "../helper";

// Modal Component
const Modal = ({ onClose, onCountdownCallback }) => {
  const [counter, setCounter] = useState(
    differenceInSeconds(addMinutes(new Date(), 3), new Date())
  );
//   const [autosaveTime, setAutosaveTime] = useState(addMinutes(new Date(), 3));

  console.log("🚀 ~ Modal ~ counter:", counter);

  const [intervalId, setIntervalId] = useState(null);

  useEffect(() => {
    if (counter && counter > 0) {
      const intervalId = setInterval(() => {
        setCounter(counter - 1);
      }, 1000);
      setIntervalId(intervalId);
    } else if (counter === 0) {
      onCountdownCallback();
      intervalId && clearInterval(intervalId);
    }

    return () => {
      intervalId && clearInterval(intervalId);
    };
    // eslint-disable-next-line
  }, [counter]);

//   const calculateTimeLimit = () => {
//     const diffInSeconds = differenceInSeconds(autosaveTime, new Date());
//     return diffInSeconds;
//   };
  return (
    <div style={styles.overlay}>
      <div style={styles.modal}>
        <h2>Your session will expire in {formatAutosaveTime(counter)}</h2>
        <p>Please interact with the page to continue.</p>
        <button onClick={onClose}>Close</button>
      </div>
    </div>
  );
};

// Main Component
const InactivityTracker = () => {
  const [inactive, setInactive] = useState(false);
  const inactivityTime = 10 * 1000; // 15 minutes in milliseconds

  let timeoutId = null;

  // Reset the inactivity timer
  const resetInactivityTimeout = () => {
    clearTimeout(timeoutId);
    timeoutId = setTimeout(() => {
      setInactive(true);
    }, inactivityTime);
    setInactive(false); // If user interacts, reset the inactivity flag
  };

  useEffect(() => {
    const handleUserActivity = () => resetInactivityTimeout();

    const removeActivityEvents = () => {
      window.removeEventListener("mousemove", handleUserActivity);
      window.removeEventListener("keydown", handleUserActivity);
      clearTimeout(timeoutId);
    };

    if (inactive) {
      removeActivityEvents();
      return;
    }
    // Add event listeners for user activity (mouse movement and key press)

    window.addEventListener("mousemove", handleUserActivity);
    window.addEventListener("keydown", handleUserActivity);

    // Set initial timeout
    resetInactivityTimeout();

    // Clean up event listeners on component unmount
    return () => {
      removeActivityEvents();
    };
    // eslint-disable-next-line
  }, [inactive]);

  inactive && console.log("turbo item inactive");
  return (
    <div>
      {inactive && (
        <Modal
          onClose={() => setInactive(false)}
          onCountdownCallback={() => {
            console.log("turbo onCountdownCallback triggered");
          }}
        />
      )}
      <h1>Your app content here...</h1>
    </div>
  );
};

const styles = {
  overlay: {
    position: "fixed",
    top: 0,
    left: 0,
    width: "100%",
    height: "100%",
    backgroundColor: "rgba(0, 0, 0, 0.5)",
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
  },
  modal: {
    backgroundColor: "#fff",
    padding: "20px",
    borderRadius: "8px",
    boxShadow: "0 2px 10px rgba(0, 0, 0, 0.1)",
    textAlign: "center",
  },
};

export default InactivityTracker;
