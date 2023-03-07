page 33000922 "Equipment Journals B2B"
{
    AutoSplitKey = true;
    Caption = 'Equipment Journals';
    DelayedInsert = true;
    PageType = Worksheet;
    SourceTable = "Equipment Journals B2B";
    UsageCategory = Tasks;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            field("Journal Batch Name"; Rec."Journal Batch Name")
            {
                Caption = 'Journal Batch Name';
                ApplicationArea = all;
                ToolTip = 'It Defines the Journal Batch Name.';
            }
            repeater(Control1102154000)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Posting Date.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Document No.';
                }
                field("Machine No."; Rec."Machine No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Machine No.';
                }
                field("Machine Description"; Rec."Machine Description")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Machine Description.';
                    Editable = false;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Type.';

                    trigger OnValidate();
                    begin
                        MetersEditable := Rec.Type = Rec.Type::Meters;
                        "P/B TypeEditable" := Rec.Type = Rec.Type::Meters;
                    end;
                }
                field(Meters; Rec.Meters)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Meters value.';
                    Editable = MetersEditable;
                }
                field("P/B Type"; Rec."P/B Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the P/B type.';
                    Editable = "P/B TypeEditable";
                    OptionCaption = '"PMR,BreakDown, "';
                }
                field("Start Date Time"; Rec."Start Date Time")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Starting date and time.';
                }
                field("End Date Time"; Rec."End Date Time")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Ending date and time.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Department code.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Project Code.';
                    Caption = 'shortcut Dimension 1 Code';
                }
                field("Work Center No."; Rec."Work Center No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Workcenter No.';
                }
                field(UOM; Rec.UOM)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the UOM.';
                }
                field(Time; Rec."Time(Hrs)")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Time in hours.';
                    Caption = 'Time(Hrs)';
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
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action("P&ost")
                {
                    Caption = 'P&ost';
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Posting function.';
                    Image = PostOrder;
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    begin

                        Equipment.RESET();
                        Equipment.SETRANGE("No.", Rec."Machine No.");
                        if Equipment.FINDFIRST() then
                            if Rec."Posting Date" < Equipment."Date of Installed" then
                                ERROR(MachineDateErr);

                        if not CONFIRM(Text000Lbl, false) then
                            exit;
                        Rec.TESTFIELD("Document No.");
                        Rec.PostJournals(Rec, IsPostedlocal);
                        if IsPostedlocal then
                            MESSAGE(Text001Lbl);

                        CurrPage.UPDATE(true);
                    end;
                }
            }
        }
    }

    trigger OnInit();
    begin
        "P/B TypeEditable" := true;
        MetersEditable := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        Rec.SetUpNewLine(xRec);
    end;

    trigger OnOpenPage();
    var
        JnlSelected: Boolean;
    begin

        PMJnlManagement.TemplateSelection(PAGE::"Resource Journal", false, Rec, JnlSelected);
        if not JnlSelected then
            ERROR('');
        PMJnlManagement.OpenJnl(CurrentJnlBatchName, Rec);
        MetersEditable := Rec.Type = Rec.Type::Meters;
        "P/B TypeEditable" := Rec.Type = Rec.Type::Meters;
    end;

    var
        Equipment: Record "Equipment B2B";
        PMJnlManagement: Codeunit "PMJnlManagement B2B";
        CurrentJnlBatchName: Code[10];
        Text000Lbl: Label 'Do you want to post the journals?';
        IsPostedlocal: Boolean;
        Text001Lbl: Label 'Equipment Journals were posted sucessfully.';

        [InDataSet]
        MetersEditable: Boolean;
        [InDataSet]
        "P/B TypeEditable": Boolean;
        MachineDateErr: Label 'Posting Date should not be prior to the Machine No. Date Installed.';
}

