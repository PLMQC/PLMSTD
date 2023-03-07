codeunit 33000892 "Release PLM Document B2B"
{

    trigger OnRun();
    begin
    end;

    var
        MaintSchPartRec: Record "Maintenance Schedule Part B2B";
        PMJobHeaderRec: Record "PM Job Header B2B";
        BreakDownRec: Record "Breakdown Records B2B";
        Text001Lbl: Label 'Released Job Card No. %1', Comment = '%1 = No.';
        Text002Lbl: Label 'Reopen Job Card No. %1', Comment = '%1 = No.';

    procedure ReleaseMaintSchPart(var MaintSchPart: Record "Maintenance Schedule Part B2B");
    var
        Text0001Lbl: Label 'Maintenance Scheduled is released.';
    begin
        MaintSchPartRec.RESET();
        MaintSchPartRec.SETRANGE("Maint. Sch. Template ID", MaintSchPart."Maint. Sch. Template ID");
        if MaintSchPartRec.FINDFIRST() then
            MaintSchPartRec.MODIFYALL(Status, MaintSchPartRec.Status::Released, false);
        MESSAGE(Text0001Lbl);
    end;

    procedure ReopenMaintSchPart(var MaintSchPart: Record "Maintenance Schedule Part B2B");
    begin
        MaintSchPartRec.RESET();
        MaintSchPartRec.SETRANGE("Maint. Sch. Template ID", MaintSchPart."Maint. Sch. Template ID");
        if MaintSchPartRec.FINDFIRST() then
            MaintSchPartRec.MODIFYALL(Status, MaintSchPartRec.Status::Open, false);
    end;

    procedure ReleaseWorkSheet(WorkSheet: Record "Work Sheet B2B");
    begin
        if (not WorkSheet.Posted) and (WorkSheet.Status = WorkSheet.Status::Open) then begin
            WorkSheet.VALIDATE(Status, WorkSheet.Status::Released);
            WorkSheet.MODIFY(true);
        end;
    end;

    procedure ReopenWorkSheet(WorkSheet: Record "Work Sheet B2B");
    begin
        if (not WorkSheet.Posted) and (WorkSheet.Status = WorkSheet.Status::Released) then begin
            WorkSheet.VALIDATE(Status, WorkSheet.Status::Open);
            WorkSheet.MODIFY(true);
        end;
    end;

    procedure ReleaseJobCard(var PMJobHead: Record "PM Job Header B2B");
    begin
        PMJobHeaderRec.RESET();
        PMJobHeaderRec.SETRANGE("No.", PMJobHead."No.");
        if PMJobHeaderRec.FINDFIRST() then begin
            PMJobHeaderRec.MODIFYALL(Status, PMJobHeaderRec.Status::Released, true);
            BreakDownRec.RESET();
            BreakDownRec.SETRANGE(BreakDownRec."Job Card No.", PMJobHeaderRec."No.");
            if BreakDownRec.FINDFIRST() then
                BreakDownRec."Job Card No." := PMJobHeaderRec."No.";
            BreakDownRec."Job Card Status" := PMJobHeaderRec.Status;
            BreakDownRec.MODIFYALL("Job Card Status", BreakDownRec."Job Card Status"::Released, true);
            MESSAGE(Text001Lbl, PMJobHeaderRec."No.");
        end;
    end;

    procedure ReopenJobCard(var PMJobHead: Record "PM Job Header B2B");
    begin
        PMJobHeaderRec.RESET();
        PMJobHeaderRec.SETRANGE("No.", PMJobHead."No.");
        if PMJobHeaderRec.FINDFIRST() then begin
            PMJobHeaderRec.MODIFYALL(Status, PMJobHeaderRec.Status::Open, true);
            BreakDownRec.RESET();
            BreakDownRec.SETRANGE(BreakDownRec."Job Card No.", PMJobHeaderRec."No.");
            if BreakDownRec.FINDFIRST() then
                BreakDownRec."Job Card No." := PMJobHeaderRec."No.";
            BreakDownRec."Job Card Status" := PMJobHeaderRec.Status;
            BreakDownRec.MODIFYALL("Job Card Status", BreakDownRec."Job Card Status"::Open, true);
            MESSAGE(Text002Lbl, PMJobHeaderRec."No.");
        end;
    end;
}

