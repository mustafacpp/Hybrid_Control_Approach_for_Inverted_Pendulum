🦾 The Diffident Pendulum: Hybrid Sigmoid-Blended Control

🎯 Purpose
The main goal of this project was to design a hybrid controller for a classic Inverted Pendulum system that 
doesn't "kick" like a mule.

Usually, when you switch from a Swing-up controller (pumping energy) to an LQR controller (balancing), 
the transition is a "Hard Switch." This causes a massive jerk that can rattle the motor and vibrate the 
mechanical structure.

To fix this, I implemented a Sigmoid Blending logic. Instead of a 0-to-1 jump, the system uses a smooth "S-curve" 
to gradually hand over control from the energy-based swing-up to the LQR. The objective was maximum smoothness 
and mechanical longevity.

📊 Output & Findings: "The Diffident Behavior"
The project successfully stabilized the pendulum, but it revealed a specific phenomenon I’ve dubbed "Diffident 
Behavior" (The Pısırık Controller). While the transition is indeed silky smooth, it came with a heavy price tag 
in terms of performance.

1. The Creeping Effect
Because the sigmoid curve lingers in the transition zone, the LQR gains are "muted" for too long. This causes the 
cart to settle at a snail's pace.

Initial Performance: 9 seconds (Hard Switching).

Diffident Performance: 30 seconds (Smooth Blending).

2. Steady-State Error
Due to the low gains during the final stage of settling, the controller became "shy" (diffident). 
It struggled to overcome the final bits of static friction and system damping.

Observation: The cart would get within 0.0025 m of the target but would take an eternity to close that final gap.

3. The Great Engineering Trade-off
This project serves as a perfect case study for the Comfort vs. Speed trade-off in control theory:

High Smoothness: Zero mechanical jerk, "mermer" (marble-like) stability at the top.

High Cost: Extreme settling time and asymptotic creeping.

💡 Conclusion
In the end, "Diffident Behavior" proves that you can’t have your cake and eat it too. If you want a system that 
treats your hardware like royalty, you have to accept that it will move with the urgency of a retired officer.

If you need speed, kill the sigmoid. If you need a "smooth jerk," prepare to wait 30 seconds.

!!! There are actually more details (formulation, trade-offs, etc.), that will be explained later. 