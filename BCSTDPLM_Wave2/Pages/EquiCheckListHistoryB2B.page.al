page 33000967 "Equi. Check List History B2B"
{

    AutoSplitKey = true;
    Caption = 'Equipment Check List History';
    DelayedInsert = true;
    PageType = Worksheet;
    SaveValues = true;
    SourceTable = "Equi. Check List History B2B";
    SourceTableView = SORTING("Machine ID", Code);
    UsageCategory = History;
    ApplicationArea = all;
    layout
    {
        area(content)
        {
            group(Filters)
            {
                Caption = 'Filters';
                field(MachineNo; MachineNoRec)
                {
                    Caption = 'MAchine No.';
                    TableRelation = "Equipment B2B";
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Machine No.';
                    trigger OnValidate();
                    begin
                        MachineNoOnAfterValidate();
                    end;
                }
                field(CurrDate; CurrDateRec)
                {
                    caption = 'Current Date';
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines date.';
                    trigger OnValidate();
                    begin
                        CurrDateOnAfterValidate();
                    end;
                }
            }
            repeater(Control1)
            {
                Editable = false;
                field(Date; Rec.Date)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines date.';
                }
                field("Machine ID"; Rec."Machine ID")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Machine ID.';
                }
                field("Machine Name"; Rec."Machine Name")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Machine name.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines code.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Description.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Status.';
                    OptionCaption = '" ,Ok,Not Ok"';
                }
                field("Last Modified Date"; Rec."Last Modified Date")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Last modifed date.';
                }
                field("Check List No."; Rec."Check List No.")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines checklist number.';
                }
                field("Planned Value"; Rec."Planned Value")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines planned value.';
                }
                field("Actual Value"; Rec."Actual Value")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines actual value.';
                }
                field(Units; Rec.Units)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Units.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines type.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines User ID.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin
        Rec.RESET();
        CLEAR(MachineNoRec);
        CLEAR(CurrDateRec);
    end;

    var
        MachineNoRec: Code[20];
        CurrDateRec: Date;


    procedure UpdateMachCheckList();
    begin
        Rec.RESET();
        if MachineNoRec <> '' then
            Rec.SETRANGE("Machine ID", MachineNoRec);
        if CurrDateRec <> 0D then
            Rec.SETRANGE(Date, CurrDateRec);
        CurrPage.UPDATE();
    end;

    local procedure MachineNoOnAfterValidate();
    begin
        UpdateMachCheckList();
    end;

    local procedure CurrDateOnAfterValidate();
    begin
        UpdateMachCheckList();
    end;
}

