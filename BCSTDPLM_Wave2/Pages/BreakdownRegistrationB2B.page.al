page 33000921 "Breakdown Registration B2B"
{
    Caption = 'Breakdown Registration';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = "Breakdown Records B2B";
    SourceTableView = SORTING("Breakdown Status", "Complaint No.")
                      WHERE(Posted = CONST(false),
                            "Breakdown Status" = CONST(Registration));
    UsageCategory = Tasks;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Complaint No."; Rec."Complaint No.")
                {
                    Caption = 'Registration No.';
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Registration No.';
                }
                field("Complaint Date"; Rec."Complaint Date")
                {
                    Caption = 'Registration Date';
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Registration date.';
                }
                field("Machine No."; Rec."Machine No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Machine No.';

                }
                field("Machine Name"; Rec."Machine Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Machine Name.';
                }
                field("Problem Description"; Rec."Problem Description")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Problem Description.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Posted by.';
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
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Posting date.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Remarks.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action(Complaint)
                {
                    Caption = 'Complaint';
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Complaints.';
                    Image = Confirm;

                    trigger OnAction();
                    begin

                        Equipment.RESET();
                        Equipment.SETRANGE("No.", Rec."Machine No.");
                        if Equipment.FINDFIRST() then
                            if Equipment."Date of Installed" > DT2DATE(Rec."Complaint Date") then
                                ERROR(EquimentDateErr);

                        Rec.UpdateBreakdownStatus();
                    end;
                }
            }
        }
    }

    var
        Equipment: Record "Equipment B2B";
        "MachineNo.": Code[20];
        MachineName: Text[50];
        "Employee Name": Text[30];
        ComplaintNo: Code[20];
        Text002Lbl: Label 'Complaint successfully lodged';
        EquimentDateErr: Label 'Complaint Date must not be less than Equipment date of installation.';

    procedure InsertEntry();
    var
        BreakdownRecords: Record "Breakdown Records B2B";
    begin
        BreakdownRecords."Complaint No." := Rec."Complaint No.";
        BreakdownRecords."Machine No." := Rec."Machine No.";
        BreakdownRecords."Machine Name" := Rec."Machine Name";
        BreakdownRecords."Posted By" := format(USERID());
        BreakdownRecords."Posting Date" := TODAY();
        BreakdownRecords."Problem Description" := Rec."Problem Description";
        BreakdownRecords.Criticality := Rec.Criticality;
        BreakdownRecords.INSERT();
        MESSAGE(Text002Lbl);
        CLEAR("MachineNo.");
        CLEAR(MachineName);
        CLEAR(ComplaintNo);
        CLEAR("Employee Name");
        CLEAR(Rec."Problem Description");
        CLEAR(Rec.Criticality);
    end;
}

