page 33000925 "Breakdown Complaints B2B"
{
    Caption = 'Breakdown Complaints';
    CardPageID = "Breakdown Complaints B2B";
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Breakdown Records B2B";
    SourceTableView = SORTING("Complaint No.")
                      WHERE("Breakdown Status" = CONST(Complaints));



    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Complaint No."; Rec."Complaint No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Complaint No.';
                    Editable = false;
                }
                field("Complaint Date"; Rec."Complaint Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Complaint Date.';
                    Editable = false;
                }
                field("Machine No."; Rec."Machine No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Machine No.';
                    Editable = false;
                }
                field("Machine Name"; Rec."Machine Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Machine Name.';
                    Editable = false;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Posted by.';
                    Editable = false;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Posting Date.';
                    Editable = false;
                }
                field("Problem Description"; Rec."Problem Description")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Problem Description.';
                    Editable = false;
                }
                field("Maintenance Type"; Rec."Maintenance Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Maintenance Type.';
                }
                field(Criticality; Rec.Criticality)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Criticality.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Status.';
                    Editable = false;
                    OptionCaption = 'Open,Released,Rejected';
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the remarks.';
                }
                field("Plant ID"; Rec."Plant ID")
                {
                    Caption = 'Equipment Location';
                    ApplicationArea = all;
                    ToolTip = 'It Defines the plant ID/Equipment location.';
                }
                field(System; Rec.System)
                {
                    Caption = 'Equipment Group';
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Equipment group/system.';
                }
                field(Originator; Rec.Originator)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Originator.';
                }
                field("Contact Man"; Rec."Contact Man")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the contact Person.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Re&lease")
                {
                    Caption = 'Re&lease';
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Release Function.';
                    Image = ReleaseDoc;
                    Promoted = false;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction();
                    begin
                        Rec.VALIDATE(Status, Rec.Status::Released);
                        Rec.MODIFY();
                    end;
                }
                action(Reopen)
                {
                    Caption = 'Reopen';
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Release Function.';
                    Image = ReOpen;

                    trigger OnAction();
                    begin
                        Rec.VALIDATE(Status, Rec.Status::Open);
                        Rec.MODIFY();
                    end;
                }
                action("Re&ject")
                {
                    Caption = 'Re&ject';
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Reject Function.';
                    Image = Reject;

                    trigger OnAction();
                    begin

                        Rec.VALIDATE(Status, Rec.Status::Rejected);
                        Rec.MODIFY();
                    end;
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                action("<Action1102152005>")
                {
                    Caption = 'P&ost';
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Post function.';
                    Image = Post;
                    Promoted = false;
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    begin
                        if Rec.Status = Rec.Status::Open then
                            ERROR(OpenErr);
                        if Rec.Posted = true then
                            ERROR(JobCardCreatedErr);
                        if (Rec.Status = Rec.Status::Released) or (Rec.Status = Rec.Status::Rejected) then begin
                            if Rec.Status = Rec.Status::Released then begin
                                PMJobHeader.RESET();
                                PMJobHeader.SETCURRENTKEY("Machine ID", Posted, Status);
                                PMJobHeader.SETRANGE("Machine ID", Rec."Machine No.");
                                PMJobHeader.SETRANGE(Status, Rec.Status::Released);
                                PMJobHeader.SETRANGE(Posted, false);
                                if not CONFIRM(Text002Lbl) then
                                    ERROR('');
                                if PMJobHeader.FIND('-') then
                                    ERROR(Text001Lbl);
                                if InsertEntry() then begin
                                    Rec.Posted := true;
                                    Rec."Complaint Release Date" := TODAY();
                                    Rec."Complaint Release Time" := TIME();
                                    Rec."Job Card No." := PMJobHeader."No.";
                                    Rec.MODIFY();
                                end;
                                CurrPage.UPDATE(false);
                            end else
                                Rec.Posted := true;
                            Rec.MODIFY();
                            MESSAGE(JobCardPostedTextLbl, Rec.Status);
                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        CurrPage.EDITABLE(not Rec.Posted);
    end;

    trigger OnOpenPage();
    begin
        CurrPage.EDITABLE(not Rec.Posted);
    end;

    var
        PMJobHeader: Record "PM Job Header B2B";
        PlantMaintainanceSetup: Record "Plant Maintenance Setup B2B";
        PMJobLine: Record "PM Job Line B2B";
        MachineRec: Record "Equipment B2B";
        EquipmentGRec: Record "Equipment B2B";
        NoSeriesMgt: Codeunit NoSeriesManagement;

        Text001Lbl: Label 'Machine is under maintenance';

        Text002Lbl: Label 'Do you want to create Job Card ?';

        JobCardTextLbl: Label 'Breackdown Job Card No.:%1 Created Successfully.', Comment = '%1 = No.';

        OpenErr: Label 'Status must be open.';
        JobCardCreatedErr: Label 'Job card has already been created.';
        JobCardPostedTextLbl: Label 'Status posted with %1.', Comment = '%1 = Status';

    procedure InsertEntry(): Boolean;
    begin
        PlantMaintainanceSetup.GET();
        PMJobHeader.INIT();
        PMJobHeader."No." := NoSeriesMgt.GetNextNo(PlantMaintainanceSetup."Break Down Job Card", TODAY(), true);
        PMJobHeader."Machine ID" := Rec."Machine No.";
        PMJobHeader."Machine Name" := Rec."Machine Name";
        PMJobHeader."Complaint No." := Rec."Complaint No.";
        PMJobHeader.Type := PMJobHeader.Type::BreakDown;
        PMJobHeader."Created By" := Format(USERID());
        PMJobHeader."Created Date" := TODAY();
        PMJobHeader."Created Time" := TIME();
        PMJobHeader."Start Date Time" := Rec."Complaint Date";
        PMJobHeader."Maintenance Type" := Rec."Maintenance Type";
        PMJobHeader."Plant ID" := Rec."Plant ID";
        PMJobHeader.Originator := Rec.Originator;
        PMJobHeader."Contact Man" := Rec."Contact Man";
        MachineRec.GET(Rec."Machine No.");

        PMJobHeader."Shortcut Dimension 1 Code" := MachineRec."Shortcut Dimension 1 Code";
        PMJobHeader."Shortcut Dimension 2 Code" := MachineRec."Shortcut Dimension 2 Code";
        PMJobHeader."Work Center" := MachineRec."M/W No.";
        EquipmentGRec.SETRANGE("No.", Rec."Machine No.");
        if EquipmentGRec.FINDFIRST() then
            PMJobHeader.Resource := EquipmentGRec.Resource;


        PMJobHeader.INSERT();

        PMJobLine.INIT();
        PMJobLine."Job Header No." := PMJobHeader."No.";
        PMJobLine."Line No." := 10000;
        PMJobLine."Machine ID" := Rec."Machine No.";
        PMJobLine."Start Date" := DT2DATE(Rec."Complaint Date");
        PMJobLine.Description := Rec."Problem Description";
        PMJobLine."Complaint No." := Rec."Complaint No.";
        PMJobLine."Maintenace Type" := Rec."Maintenance Type";
        PMJobLine."Maintenace Type Name" := Rec."Maintenance Type Name";
        PMJobLine.INSERT();
        MESSAGE(JobCardTextLbl, PMJobHeader."No.");
        exit(true);
    end;
}

