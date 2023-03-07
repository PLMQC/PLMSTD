report 33000897 "PM Job Card Perodic B2B"
{


    Caption = 'PM Job Card Perodic';
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem(Equipment; "Equipment B2B")
        {
            DataItemTableView = SORTING("No.") WHERE("Is In Use" = CONST(true));
            RequestFilterFields = "No.", "Machine Location", "Date Filter";
            dataitem("Maintenance Schedule Part"; "Maintenance Schedule Part B2B")
            {
                CalcFields = "Total Cost";
                DataItemLink = "Machine ID" = FIELD("No.");
                DataItemTableView = SORTING("Machine ID");

                trigger OnAfterGetRecord();
                begin
                    PMRJobLineRec.RESET();
                    PMRJobLineRec.SETCURRENTKEY("Machine ID", "Next Due Date", "Frequency ID", Posted);
                    PMRJobLineRec.SETRANGE("Machine ID", "Machine ID");
                    PMRJobLineRec.SETRANGE("Next Due Date", "Next Due Date");
                    PMRJobLineRec.SETRANGE("Frequency ID", "Frequency ID");
                    PMRJobLineRec.SETRANGE(Posted, false);
                    Equipment.GET(Equipment."No.");
                    if not PMRJobLineRec.FIND('-') then begin
                        JobNo := '';
                        PMJobHeader.INIT();
                        PMJobHeader."No." := NoSeriesMgt.GetNextNo(PlantMaintainanceSetup."PMR Job Card", WORKDATE(), true);
                        JobNo := PMJobHeader."No.";
                        PMJobHeader.VALIDATE("Machine ID", "Machine ID");
                        PMJobHeader."Maintenance Type" := "Maintenance Schedule Part"."Maintenance Type";
                        if MaintenceTypeGrec.GET(PMJobHeader."Maintenance Type") then
                            PMJobHeader.External := MaintenceTypeGrec.External;

                        PMJobHeader."Expected Resource Cost" := "Maintenance Schedule Part"."Resource Cost";
                        PMJobHeader."Expected Spares Cost" := "Maintenance Schedule Part"."Spares Cost";
                        PMJobHeader."Frequency Name" := "Maintenance Schedule Part"."Frequency Name";
                        PMJobHeader."Plant ID" := Equipment."Machine Location";
                        PMJobHeader."Estimated Time" := "Maintenance Schedule Part"."Hrs Required";
                        PMJobHeader."Planned Total Cost" := "Maintenance Schedule Part"."Total Cost";
                        PMJobHeader."Created Date" := WORKDATE();
                        PMJobHeader."Created By" := Format(USERID());
                        PMJobHeader."Maintenance Date" := "Maintenance Schedule Part"."Next Due Date";
                        EquipmentGrec.RESET();
                        EquipmentGrec.SETRANGE("No.", "Machine ID");
                        if EquipmentGrec.FINDFIRST() then
                            PMJobHeader."Meter Reading" := EquipmentGrec."Meter Reading";
                        if Equipment."A.M.C" = Equipment."A.M.C"::Yes then begin
                            PMJobHeader."A.M.C" := Equipment."A.M.C"::Yes;
                            PMJobHeader."Vendor No." := Equipment."A.M.C Vendor No.";
                            PMJobHeader."Vendor Name" := Equipment."A.M.C Vendor Name";
                        end else
                            if Equipment.Warranty = Equipment.Warranty::Yes then begin
                                PMJobHeader.Warranty := Equipment.Warranty::Yes;
                                PMJobHeader."Vendor No." := Equipment."Warranty Vendor No.";
                                PMJobHeader."Vendor Name" := Equipment."Warranty Vendor Name";
                            end;

                        JobCardCreated := true;
                        Window.UPDATE(1, "Maintenance Schedule Part"."Machine ID");
                        PMJobHeader.INSERT(true);



                        PMJobLine.INIT();
                        PMJobLine.TRANSFERFIELDS("Maintenance Schedule Part");
                        PMJobLine."Job Header No." := PMJobHeader."No.";

                        PMJobLineLineNo := 10000;
                        PMJobLine."Line No." := PMJobLineLineNo;
                        PMJobLine."Schedule Template ID" := "No.";
                        PMJobLine."Hrs Required" := "Hrs Required";

                        PMJobLine."Planned Total Cost" := "Total Cost";
                        if PMJobHeader.Type = PMJobHeader.Type::PMR then
                            InsertJobOperationParticulars("No.", "Machine ID", PMJobHeader."No.");
                        PMJobLine.INSERT();

                        InsertJobCardLineProcedures(PMJobLine, "Maintenance Schedule Part");


                        MaintenanceShPart.RESET();
                        MaintenanceShPart.SETRANGE("Machine ID", "Machine ID");
                        MaintenanceShPart.SETRANGE("No.", "No.");
                        if MaintenanceShPart.FIND('-') then begin
                            FrequencyGrec.RESET();
                            FrequencyGrec.SETRANGE(Code, MaintenanceShPart."Frequency ID");
                            if not (FrequencyGrec."Frequency Type" = FrequencyGrec."Frequency Type"::RUNTIME)
                                              or (FrequencyGrec."Frequency Type" = FrequencyGrec."Frequency Type"::"METER BASED") then begin
                                MaintenanceShPart.VALIDATE("Start Date", "Next Due Date");
                                MaintenanceShPart."Last Job Card Number" := JobNo;
                                MaintenanceShPart."Job Card Created" := true;
                                MaintenanceShPart.MODIFY();
                            end;
                            Frequency.GET("Maintenance Schedule Part"."Frequency ID");
                            Equipment.CALCFIELDS("Total Run Time - Prod");
                            Equipment.CALCFIELDS("Total Run Time Non Prod.");
                            Equipment.CALCFIELDS("Meter Reading");
                            TotRunTime := Equipment."Total Run Time - Prod" + Equipment."Total Run Time Non Prod.";
                            TotMeterTime := Equipment."Meter Reading";
                            if Frequency."Frequency Type" = Frequency."Frequency Type"::RUNTIME then begin
                                MaintenanceShPart."Line Late Reading" := TotRunTime;
                                MaintenanceShPart."Last Job Card Number" := JobNo;
                                MaintenanceShPart."Job Card Created" := true;
                                MaintenanceShPart.MODIFY();
                            end else
                                if Frequency."Frequency Type" = Frequency."Frequency Type"::"METER BASED" then begin
                                    MaintenanceShPart."Line Late Reading" := TotMeterTime;
                                    MaintenanceShPart."Last Job Card Number" := JobNo;
                                    MaintenanceShPart."Job Card Created" := true;
                                    MaintenanceShPart.MODIFY();
                                end;
                        end;
                    end else begin
                        PMJobLine.INIT();
                        PMJobLine.TRANSFERFIELDS("Maintenance Schedule Part");
                        PMJobLine."Job Header No." := JobNo;
                        PMJobLine."Line No." := PMJobLineLineNo + 10000;
                        PMJobLineLineNo += 10000;
                        PMJobLine."Schedule Template ID" := "No.";
                        PMJobLine."Start Date" := WORKDATE();
                        PMJobLine."Hrs Required" := "Hrs Required";
                        PMJobLine."Planned Total Cost" := "Total Cost";
                        PMJobHeader."Created Date" := WORKDATE();
                        PMJobHeader."Created By" := Format(USERID());
                        if PMJobHeader.Type = PMJobHeader.Type::PMR then
                            InsertJobOperationParticulars("No.", "Machine ID", JobNo);
                        PMJobLine.INSERT();
                    end;

                    MaintenanceShPart.RESET();
                    MaintenanceShPart.SETRANGE("Machine ID", "Machine ID");
                    MaintenanceShPart.SETRANGE("No.", "No.");
                    if MaintenanceShPart.FIND('-') then begin
                        if (Frequency."Frequency Type" = Frequency."Frequency Type"::RUNTIME)
                             or (Frequency."Frequency Type" = Frequency."Frequency Type"::"METER BASED") then begin
                            RuntimeFreqHeader.GET(MaintenanceShPart."Frequency Code");
                            RuntimeFreqLine.RESET();
                            RuntimeFreqLine.SETRANGE("Frequency Code", "Frequency Code");
                            RuntimeFreqLine.SETRANGE("Job Card Created", false);
                            if RuntimeFreqLine.FINDFIRST() then
                                if RuntimeFreqLine.Type = RuntimeFreqLine.Type::Variable then begin
                                    LineNo := RuntimeFreqLine."Line No.";

                                    RuntimeFreqLine2.RESET();
                                    RuntimeFreqLine2.SETRANGE("Frequency Code", "Frequency Code");
                                    RuntimeFreqLine2.SETRANGE(RuntimeFreqLine2."Line No.", LineNo);
                                    if RuntimeFreqLine2.FINDFIRST() then
                                        if RuntimeFreqLine2.Type = RuntimeFreqLine2.Type::Variable then begin
                                            MaintenanceShPart."Date Interval" := RuntimeFreqLine2.Period;
                                            MaintenanceShPart.VALIDATE("Date Interval");
                                        end else
                                            if RuntimeFreqLine2.Type = RuntimeFreqLine2.Type::Fixed then begin
                                                MaintenanceShPart."Date Interval" := RuntimeFreqLine2.Period;
                                                MaintenanceShPart."Start Date" := "Next Due Date";
                                                MaintenanceShPart.VALIDATE("Date Interval");
                                            end;
                                end else
                                    if RuntimeFreqLine.Type = RuntimeFreqLine.Type::Fixed then begin
                                        MaintenanceShPart."Date Interval" := RuntimeFreqLine.Period;
                                        MaintenanceShPart."Start Date" := "Next Due Date";

                                    end;
                        end;
                        MaintenanceShPart.MODIFY();
                    end;
                end;

                trigger OnPreDataItem();
                var

                begin
                    PMJobLineLineNo := 10000;
                    PlantMaintainanceSetup.GET();
                    MARKEDONLY(false);
                    if FINDFIRST() then
                        repeat
                            Frequency.GET("Frequency ID");
                            Equipment.GET("Machine ID");
                            if ((Equipment."Shortcut Dimension 1 Code" = '') or (Equipment."Shortcut Dimension 2 Code" = '')) then
                                if Equipment."Shortcut Dimension 1 Code" = '' then
                                    ERROR(Text007Lbl, Equipment."No.", Equipment.FIELDCAPTION("Shortcut Dimension 1 Code"))
                                else
                                    if Equipment."Shortcut Dimension 2 Code" = '' then
                                        ERROR(Text007Lbl, Equipment."No.", Equipment.FIELDCAPTION("Shortcut Dimension 2 Code"));
                            if Frequency."Run Time" then begin
                                RuntimeFreqHeader.RESET();
                                RuntimeFreqHeader.SETRANGE(Code, "Frequency Code");
                                RuntimeFreqHeader.SETRANGE("Job Card Options", RuntimeFreqHeader."Job Card Options"::"Run Time Based");
                                if RuntimeFreqHeader.FINDFIRST() then begin
                                    RuntimeFreqLine.RESET();
                                    RuntimeFreqLine.SETRANGE("Frequency Code", "Frequency Code");
                                    if RuntimeFreqLine.FINDFIRST() then begin
                                        Equipment.CALCFIELDS("Total Run Time - Prod");
                                        Equipment.CALCFIELDS("Total Run Time Non Prod.");
                                        Equipment.CALCFIELDS("Meter Reading");
                                        TotRunTime := Equipment."Total Run Time - Prod" + Equipment."Total Run Time Non Prod.";
                                        TotMeterTime := Equipment."Meter Reading";
                                        if Frequency."Frequency Type" = Frequency."Frequency Type"::RUNTIME then begin
                                            RuntimeFreqLine.TESTFIELD("Create Job Card", true);
                                            if RuntimeFreqLine.Type = RuntimeFreqLine.Type::Variable then begin
                                                if (TotRunTime >= RuntimeFreqLine."Max. Interval") then
                                                    MARK(true);
                                            end else
                                                if RuntimeFreqLine.Type = RuntimeFreqLine.Type::Fixed then
                                                    if TotRunTime >= (RuntimeFreqLine."Max. Interval" + "Maintenance Schedule Part"."Line Late Reading") then
                                                        MARK(true);
                                        end;
                                        if Frequency."Frequency Type" = Frequency."Frequency Type"::"METER BASED" then
                                            if RuntimeFreqLine.Type = RuntimeFreqLine.Type::Variable then begin
                                                if (TotMeterTime >= RuntimeFreqLine."Max. Interval") then
                                                    MARK(true)
                                                else
                                                    if RuntimeFreqLine."Create Job Card" then
                                                        MARK(true);
                                            end else
                                                if RuntimeFreqLine.Type = RuntimeFreqLine.Type::Fixed then begin
                                                    DifferenceMeter := (TotMeterTime - "Maintenance Schedule Part"."Line Late Reading");
                                                    if DifferenceMeter >= (RuntimeFreqLine."Max. Interval" - RuntimeFreqLine."Min. Interval") then
                                                        MARK(true)
                                                    else
                                                        if RuntimeFreqLine."Create Job Card" then
                                                            MARK(true);
                                                end;
                                    end;
                                end;
                                RuntimeFreqHeader.RESET();
                                RuntimeFreqHeader.SETRANGE(Code, "Frequency Code");
                                RuntimeFreqHeader.SETFILTER("Job Card Options", '%1', RuntimeFreqHeader."Job Card Options"::"Period And Runtime Based");
                                if RuntimeFreqHeader.FINDFIRST() then begin
                                    RuntimeFreqLine.RESET();
                                    RuntimeFreqLine.SETRANGE("Frequency Code", RuntimeFreqHeader.Code);
                                    if RuntimeFreqLine.FINDFIRST() then begin
                                        Frequency.GET("Frequency ID");
                                        Equipment.GET("Machine ID");
                                        if Frequency."Run Time" then begin
                                            Equipment.CALCFIELDS("Total Run Time - Prod");
                                            Equipment.CALCFIELDS("Total Run Time Non Prod.");
                                            Equipment.CALCFIELDS("Meter Reading");
                                            TotRunTime := Equipment."Total Run Time - Prod" + Equipment."Total Run Time Non Prod.";
                                            TotMeterTime := Equipment."Meter Reading";
                                            if Frequency."Frequency Type" = Frequency."Frequency Type"::RUNTIME then
                                                if RuntimeFreqLine.Type = RuntimeFreqLine.Type::Variable then begin
                                                    if (TotRunTime >= RuntimeFreqLine."Max. Interval") then
                                                        MARK(true);
                                                end else
                                                    if RuntimeFreqLine.Type = RuntimeFreqLine.Type::Fixed then
                                                        if TotRunTime >= (RuntimeFreqLine."Max. Interval" + "Maintenance Schedule Part"."Line Late Reading") then
                                                            MARK(true);
                                            if Frequency."Frequency Type" = Frequency."Frequency Type"::"METER BASED" then
                                                if RuntimeFreqLine.Type = RuntimeFreqLine.Type::Variable then begin
                                                    if (TotMeterTime >= RuntimeFreqLine."Max. Interval") then
                                                        MARK(true)
                                                    else
                                                        if RuntimeFreqLine."Create Job Card" then
                                                            MARK(true);
                                                end else
                                                    if RuntimeFreqLine.Type = RuntimeFreqLine.Type::Fixed then begin
                                                        DifferenceMeter := (TotMeterTime - "Maintenance Schedule Part"."Line Late Reading");
                                                        if DifferenceMeter >= (RuntimeFreqLine."Max. Interval" - RuntimeFreqLine."Min. Interval") then
                                                            MARK(true)
                                                        else
                                                            if RuntimeFreqLine."Create Job Card" then
                                                                MARK(true);
                                                    end;
                                            if "Next Due Date" <= Equipment.GETRANGEMAX(Equipment."Date Filter") then
                                                MARK(true);
                                        end else begin
                                            NextDueDateCal := CALCDATE(RuntimeFreqLine.Period, "Next Due Date");
                                            if ("Next Due Date" >= NextDueDateCal) and ("Next Due Date" <= WORKDATE()) then
                                                MARK(true);
                                            if (NextDueDateCal >= "Next Due Date") and ("Next Due Date" >= WORKDATE()) then
                                                MARK(true);
                                        end;
                                    end;
                                end;
                            end else begin
                                NextDueDateCal := CALCDATE(PlantMaintainanceSetup.Allowance, WORKDATE());
                                if ("Next Due Date" >= NextDueDateCal) and ("Next Due Date" <= WORKDATE()) then
                                    MARK(true);

                                if ("Next Due Date" >= Equipment.GETRANGEMIN(Equipment."Date Filter"))
                                      and ("Next Due Date" <= Equipment.GETRANGEMAX(Equipment."Date Filter")) then
                                    MARK(true);
                            end;
                        until NEXT() = 0;
                    MARKEDONLY(true);
                end;
            }

            trigger OnAfterGetRecord();
            begin
                PMJobLine2.RESET();
                PMJobLine2.SETCURRENTKEY("Machine ID", Posted);
                PMJobLine2.SETRANGE("Machine ID", "No.");
                PMJobLine2.SETRANGE(Posted, false);
                if PMJobLine2.FIND('-') then
                    CurrReport.SKIP();
            end;

            trigger OnPreDataItem();
            begin
                JobCardCreated := false;
            end;
        }
    }

    requestpage
    {
        Caption = 'PM Job Card Perodic';
        SaveValues = true;

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPostReport();
    begin
        Window.CLOSE();
        if JobCardCreated then
            MESSAGE(Text006Lbl)
        else
            MESSAGE(Text002Lbl, Today())
    end;

    trigger OnPreReport();
    begin
        Window.OPEN(Text003Lbl);
    end;

    var
        PMJobHeader: Record "PM Job Header B2B";
        FilterPartLines: Record "Equipment Schedule Line B2B";
        WorkSheet2: Record "Work Sheet B2B";
        MachineSchLine: Record "Equipment Schedule Line B2B";
        PMJobLine: Record "PM Job Line B2B";
        PMRJobLineRec: Record "PM Job Line B2B";
        PlantMaintainanceSetup: Record "Plant Maintenance Setup B2B";
        MaintenanceShPart: Record "Maintenance Schedule Part B2B";
        TempMntPartLines: Record "PM Job OP Particulars B2B" temporary;
        PMJobLine2: Record "PM Job Line B2B";

        JobCardLineProcLRec2: Record "Job Card  Line Procedure B2B";
        RuntimeFreqLine: Record "Runtime Frequency Line B2B";
        RuntimeFreqHeader: Record "Runtime Frequency Header B2B";
        Frequency: Record "Frequency  B2B";
        MaintenceTypeGrec: Record "Maintenance Type B2B";
        RuntimeFreqLine2: Record "Runtime Frequency Line B2B";
        MaintSchedLineProcedLRec: Record "Maint. Sched. Line Proc B2B";
        FrequencyGrec: Record "Frequency  B2B";
        EquipmentGrec: Record "Equipment B2B";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Text002Lbl: Label 'Conditions not satisfied %1', Comment = '%1= today()';
        JobNo: Code[20];
        PMJobLineLineNo: Integer;
        JobCardCreated: Boolean;


        Text003Lbl: Label '"Machine......#1######################\  ",', Comment = '%1 = ';
        Window: Dialog;
        NextDueDateCal: Date;
        TotRunTime: Decimal;
        Text006Lbl: Label 'One or more job cards created.';
        LineNo: Integer;
        TotMeterTime: Decimal;
        DifferenceMeter: Decimal;

        StepNum: Integer;
        Text007Lbl: Label '"For the  Equipment %1 . %2  Must Not Be Empty. "', Comment = '%1 = No., %2 =Shortcut Dimension 2 Code ';


    procedure InsertJobOperationParticulars(TemlateIDtoGetLines: Code[20]; MachineIDLocal: Code[20]; JobCardNo: Code[20]);
    var

        OriginalMntPartLines: Record "PM Job OP Particulars B2B";
        SlNOgeneratorLine: Integer;
        KeyGeneratorLine: Integer;
    begin
        SlNOgeneratorLine := 0;
        KeyGeneratorLine := 0;

        FilterPartLines.RESET();
        FilterPartLines.SETCURRENTKEY("Sl.No.");
        if FilterPartLines.FIND('+') then
            SlNOgeneratorLine := FilterPartLines."Sl.No.";
        SlNOgeneratorLine += 1;

        FilterPartLines.RESET();

        FilterPartLines.SETCURRENTKEY("Line No.");
        if FilterPartLines.FIND('+') then
            KeyGeneratorLine := FilterPartLines."Line No.";
        KeyGeneratorLine += 1;

        FilterPartLines.RESET();
        FilterPartLines.SETRANGE("Schedule Template ID", TemlateIDtoGetLines);
        if FilterPartLines.FIND('-') then begin
            TempMntPartLines.DELETEALL();

            repeat
                TempMntPartLines.INIT();
                TempMntPartLines."Sl. No." := SlNOgeneratorLine;
                TempMntPartLines."Line No." := KeyGeneratorLine;
                TempMntPartLines."Machine ID" := MachineIDLocal;
                TempMntPartLines."ScheduleTemplate ID" := TemlateIDtoGetLines;
                TempMntPartLines."Line Type" := FilterPartLines."Line Type";
                TempMntPartLines."Line Type Name" := FilterPartLines."Line Type Name";
                TempMntPartLines.Description := FilterPartLines.Description;
                TempMntPartLines."Time Required" := FilterPartLines."Time Required";
                TempMntPartLines."I/R Code" := FilterPartLines."I/R Code";
                TempMntPartLines."I/R Description" := FilterPartLines."I/R Description";
                TempMntPartLines.Quantity := FilterPartLines.Quantity;
                TempMntPartLines."Unit Cost" := FilterPartLines."Unit Cost";
                TempMntPartLines.UOM := FilterPartLines.UOM;
                TempMntPartLines.Amount := FilterPartLines.Amount;
                TempMntPartLines."Job Card No." := JobCardNo;
                TempMntPartLines.Resource := (FilterPartLines."Resource Person") or (FilterPartLines."Resource Equipment");
                TempMntPartLines."Spares & Consumables" := FilterPartLines."Spares & Consumables";

                TempMntPartLines.INSERT();
                SlNOgeneratorLine += 1;
                KeyGeneratorLine += 1;
            until FilterPartLines.NEXT() = 0;

            if TempMntPartLines.FIND('-') then begin
                OriginalMntPartLines.LOCKTABLE();
                repeat
                    OriginalMntPartLines.INIT();
                    OriginalMntPartLines.TRANSFERFIELDS(TempMntPartLines);
                    OriginalMntPartLines.INSERT(true);
                until TempMntPartLines.NEXT() = 0;
            end;
        end;
    end;

    procedure InsertJobCardLineProcedures(PMJobLineRecPar: Record "PM Job Line B2B"; MaintschedPartRecPar: Record "Maintenance Schedule Part B2B");
    var
        JobCardLineProcLRec: Record "Job Card  Line Procedure B2B";
    begin
        MaintSchedLineProcedLRec.RESET();
        MaintSchedLineProcedLRec.SETRANGE("Machine Sched. Part No.", MaintschedPartRecPar."No.");
        MaintSchedLineProcedLRec.SETRANGE("Machine ID", MaintschedPartRecPar."Machine ID");
        if MaintSchedLineProcedLRec.FINDFIRST() then begin
            JobCardLineProcLRec2.RESET();
            JobCardLineProcLRec2.SETCURRENTKEY("Job Card No.", "Machine ID", "Job Card  Line No.");
            JobCardLineProcLRec2.SETRANGE("Job Card No.", PMJobLineRecPar."Job Header No.");
            JobCardLineProcLRec2.SETRANGE("Machine ID", PMJobLineRecPar."Machine ID");
            JobCardLineProcLRec2.SETRANGE("Job Card  Line No.", PMJobLineRecPar."Line No.");
            if JobCardLineProcLRec2.FINDLAST() then
                StepNum := JobCardLineProcLRec2."Step No." + 1
            else
                StepNum := 1;
            repeat
                JobCardLineProcLRec.INIT();
                JobCardLineProcLRec."Job Card No." := PMJobLineRecPar."Job Header No.";
                JobCardLineProcLRec."Machine ID" := PMJobLineRecPar."Machine ID";
                JobCardLineProcLRec."Job Card  Line No." := PMJobLineRecPar."Line No.";
                JobCardLineProcLRec."Step No." := StepNum;
                JobCardLineProcLRec."Machine Name" := PMJobLineRecPar."Machine Name";
                JobCardLineProcLRec.Description := MaintSchedLineProcedLRec.Description;
                JobCardLineProcLRec."Special Tools" := MaintSchedLineProcedLRec."Special Tools";
                JobCardLineProcLRec.INSERT();
                StepNum += 1;
            until MaintSchedLineProcedLRec.NEXT() = 0;
        end;
    end;

    procedure InsertWorkSheet(MaintschedPartRecPar: Record "Maintenance Schedule Part B2B"; PMJobHeader: Record "PM Job Header B2B");
    var
        WorkSheet: Record "Work Sheet B2B";
        LineNoLVar: Integer;
    begin
        LineNoLVar := 10000;
        MachineSchLine.SETRANGE("Schedule Template ID", MaintschedPartRecPar."No.");
        if MachineSchLine.FINDFIRST() then
            repeat
                WorkSheet.INIT();
                WorkSheet.VALIDATE("Job Card No.", PMJobHeader."No.");
                WorkSheet.VALIDATE("Machine ID", PMJobHeader."Machine ID");
                WorkSheet."Line No." := LineNoLVar;
                WorkSheet.VALIDATE("Line Type", MachineSchLine."Line Type");
                WorkSheet.VALIDATE("I/R Code", MachineSchLine."I/R Code");
                WorkSheet."I/R Description" := MachineSchLine."I/R Description";
                WorkSheet.Quantity := MachineSchLine.Quantity;
                WorkSheet.VALIDATE(UOM, MachineSchLine.UOM);
                WorkSheet.VALIDATE("Unit Cost", MachineSchLine."Unit Cost");
                WorkSheet.VALIDATE(Amount, MachineSchLine.Amount);
                WorkSheet.VALIDATE(Resource, MachineSchLine."Resource Equipment");
                WorkSheet2.RESET();
                WorkSheet2.SETFILTER("Job Card No.", '<>%1', PMJobHeader."No.");
                WorkSheet2.SETRANGE("Machine ID", PMJobHeader."Machine ID");
                WorkSheet2.SETRANGE(Resource, MachineSchLine."Resource Equipment");
                if WorkSheet2.FINDFIRST() then
                    WorkSheet."Assigned Job No." := WorkSheet2."Job Card No.";
                WorkSheet.INSERT();
                LineNoLVar += 10000;
            until MachineSchLine.NEXT() = 0;
    end;

}

