package com.rrets.employeeservice.service.Timesheet;

import com.rrets.employeeservice.Exception.TimesheetException;
import com.rrets.employeeservice.model.timesheet.Timesheet;
import com.sun.jdi.InvocationException;

import java.lang.reflect.InvocationTargetException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

public interface TimesheetService {
    Timesheet getTimesheet(LocalDate date);

    Timesheet saveTimesheet(Timesheet timesheet);

    Timesheet updateTimesheet(Timesheet timesheet) throws InvocationException, IllegalAccessException, InvocationTargetException;

    Map<LocalDate, String> deleteTimesheets(Timesheet timesheet) throws TimesheetException, InvocationTargetException, IllegalAccessException;

    List<Timesheet> getTimesheets();

}
