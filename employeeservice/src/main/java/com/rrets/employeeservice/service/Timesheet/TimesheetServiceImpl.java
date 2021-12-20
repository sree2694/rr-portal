package com.rrets.employeeservice.service.Timesheet;

import com.rrets.employeeservice.Exception.TimesheetException;
import com.rrets.employeeservice.model.timesheet.Timesheet;
import com.rrets.employeeservice.repository.TimeSheetRepository;
import com.rrets.employeeservice.utils.NullAwareBeanUtilsBean;
import com.sun.jdi.InvocationException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtilsBean;
import org.springframework.stereotype.Service;

import java.lang.reflect.InvocationTargetException;
import java.time.LocalDate;
import java.util.*;

@Service
@Slf4j
public class TimesheetServiceImpl implements TimesheetService{
private final TimeSheetRepository timeSheetRepository;

    public TimesheetServiceImpl(TimeSheetRepository timeSheetRepository) {
        this.timeSheetRepository = timeSheetRepository;
    }

    @Override
    public Timesheet getTimesheet(LocalDate date) {
        Optional<Timesheet> timesheet = timeSheetRepository.findByDate(date);
        return timesheet.orElse(null);
    }

    @Override
    public Timesheet saveTimesheet(Timesheet timesheet) {
       timesheet.setStatus("Approved");
       timesheet.setStatus("Termed");

        return timeSheetRepository.save(timesheet);
    }

    @Override
    public Timesheet updateTimesheet(Timesheet timesheet) throws InvocationException, IllegalAccessException, InvocationTargetException {
        Timesheet existingTs = getTimesheet(timesheet.getDate());
        log.info("Found Status: " + existingTs.getClientName());
        BeanUtilsBean notNull = new NullAwareBeanUtilsBean();
        notNull.copyProperties(existingTs, timesheet);
        return timeSheetRepository.save(existingTs);
    }

    @Override
    public Map<LocalDate, String> deleteTimesheets(Timesheet timesheet) throws TimesheetException {
Map<LocalDate, String> processedTimesheets = new HashMap<>();
        if (null == timesheet || null == timesheet.getDates()) {
            throw new TimesheetException("TimeSheet to delete is null! ");
        }

        for (LocalDate date : timesheet.getDates()) {
            if (Boolean.TRUE.equals(deleteTimesheet(date))) {
                processedTimesheets.put(date, "Success");
            } else {
                processedTimesheets.put(date, "Failure");
            }
        }
return processedTimesheets;
     }

    private Boolean deleteTimesheet(LocalDate date) throws TimesheetException {
        if (null == date) {
            throw new TimesheetException("Timesheet to delete is null!");
        }
        Optional<Timesheet> timesheet =timeSheetRepository.findByDate(date);
        if (timesheet.isPresent()) {
            timesheet.get().setDate(date);
            timeSheetRepository.save(timesheet.get());
            return Boolean.TRUE;
        } else {
            return Boolean.FALSE;
        }
    }

    @Override
    public List<Timesheet> getTimesheets() {
        List<Timesheet> timesheets = new ArrayList<>();
        Iterable<Timesheet> timesheetIterable = timeSheetRepository.findAllByActiveAndDeleted("Y","N");
        for (Timesheet timesheet : timesheetIterable) {
            timesheets.add(timesheet);
        }
        return timesheets;
    }
}
