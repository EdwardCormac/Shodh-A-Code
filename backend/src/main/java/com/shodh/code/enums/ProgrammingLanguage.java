package com.shodh.code.enums;

public enum ProgrammingLanguage {
    JAVA("java", "Main.java"),
    PYTHON("python", "main.py"),
    CPP("cpp", "main.cpp");

    private final String value;
    private final String fileName;

    ProgrammingLanguage(String value, String fileName) {
        this.value = value;
        this.fileName = fileName;
    }

    public String getValue() {
        return value;
    }

    public String getFileName() {
        return fileName;
    }

    public static ProgrammingLanguage fromValue(String value) {
        for (ProgrammingLanguage lang : values()) {
            if (lang.value.equalsIgnoreCase(value)) {
                return lang;
            }
        }
        throw new IllegalArgumentException("Invalid language: " + value);
    }
}