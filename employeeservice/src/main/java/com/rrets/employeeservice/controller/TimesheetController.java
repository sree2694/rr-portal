package com.rrets.employeeservice.controller;

import com.rrets.employeeservice.model.timesheet.Timesheet;
import com.rrets.employeeservice.service.Timesheet.TimesheetService;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api")
public class TimesheetController {

    private final TimesheetService timesheetService;


    public TimesheetController(TimesheetService timesheetService) {
        this.timesheetService = timesheetService;
    }

    @GetMapping("/timesheet/{date}")
    public TimesheetService getTimesheetService(@PathVariable LocalDate date) {
        return (TimesheetService) timesheetService.getTimesheet(date);
    }

    @GetMapping("/timesheet")
    public List<Timesheet> getTimesheets() {
        return timesheetService.getTimesheets();
    }

    @PostMapping("/timesheet")
    public Timesheet saveTimesheet(@RequestBody Timesheet timesheet) {
        return timesheetService.saveTimesheet(timesheet);
    }
}
