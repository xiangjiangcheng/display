package com.display.maven.display.domain;

public class SmallInnovateWithBLOBs extends SmallInnovate {
    private String achievementdetails;

    private String achievementsummary;

    public String getAchievementdetails() {
        return achievementdetails;
    }

    public void setAchievementdetails(String achievementdetails) {
        this.achievementdetails = achievementdetails == null ? null : achievementdetails.trim();
    }

    public String getAchievementsummary() {
        return achievementsummary;
    }

    public void setAchievementsummary(String achievementsummary) {
        this.achievementsummary = achievementsummary == null ? null : achievementsummary.trim();
    }
}