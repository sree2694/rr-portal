package com.rrets.employeeservice.repository;

import com.rrets.employeeservice.model.timesheet.Timesheet;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository

public interface TimeSheetRepository extends CrudRepository<Timesheet, LocalDate> {
    Optional<Timesheet> findByDate(LocalDate date);

    List<Timesheet> findAllByActiveAndDeleted(String active, String deleted);

    Optional<Timesheet> findTimesheetByClientName(String clientName);
}
