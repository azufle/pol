package edu.gmu.mason.vanilla.hacking;

public class TimeStep {

    private long startTime;
    private long endTime;



    // getters and setters for startTime and endTime

    public long getStartTime() {
        return startTime;
    }

    public void setStartTime() {
        this.startTime = System.currentTimeMillis();
    }

    public long getEndTime() {
        return endTime;
    }

    public void setEndTime() {
        this.endTime = System.currentTimeMillis();
    }

}

