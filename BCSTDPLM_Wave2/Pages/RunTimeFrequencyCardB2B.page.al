page 33000977 "Run Time Frequency Card B2B"
{

    Caption = 'Run Time Frequency Card';
    PageType = Card;
    SourceTable = "Runtime Frequency Header B2B";
    UsageCategory = Documents;
    ApplicationArea = all;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Rec.Code)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Code.';

                    trigger OnAssistEdit();
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.UPdate();
                    end;
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
                    OptionCaption = 'New,Under Development,Certified';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines date.';
                    Editable = "Start DateEditable";
                }
                field("Job Card Options"; Rec."Job Card Options")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Job Card Options.';
                    OptionCaption = 'Run Time Based,Period And Runtime Based';

                    trigger OnValidate();
                    begin
                        CurrPage.RunTimeFrequencySubform.PAGE.EditablePeriod(Rec."Job Card Options");
                        CurrPage.UPDATE();
                    end;
                }
                field("Unit Of Measure Code"; Rec."Unit Of Measure Code")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines UOM code.';
                }
            }
            part(RunTimeFrequencySubform; "RunTimeFrequencySubform B2B")
            {
                Caption = 'RunTimeFrequencySubform';
                SubPageLink = "Frequency Code" = FIELD(Code);
                ApplicationArea = ALL;
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
                action("&Under Development")
                {
                    Caption = '&Under Development';
                    Image = Delivery;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Staus of Under development.';

                    trigger OnAction();
                    begin
                        Rec.UnderDevelopment();
                        "Start DateEditable" := true;
                    end;
                }
                action("&Certified")
                {
                    Caption = '&Certified';
                    Image = Certificate;
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Status of Certified.';

                    trigger OnAction();
                    begin
                        Rec.Certified();
                        "Start DateEditable" := false;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        if Rec.Status = Rec.Status::Certified then
            "Start DateEditable" := false
        else
            "Start DateEditable" := true;

        CurrPage.RunTimeFrequencySubform.PAGE.EditablePeriod(Rec."Job Card Options");
    end;

    trigger OnInit();
    begin
        "Start DateEditable" := true;
    end;

    trigger OnOpenPage();
    begin
        if Rec.Status = Rec.Status::Certified then
            "Start DateEditable" := false
        else
            "Start DateEditable" := true;

        CurrPage.RunTimeFrequencySubform.PAGE.EditablePeriod(Rec."Job Card Options");
    end;

    var
        [InDataSet]
        "Start DateEditable": Boolean;
}

