using System;
using TMPro;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

// Token: 0x02000038 RID: 56
public class ChatController : MonoBehaviour
{
	// Token: 0x060000EA RID: 234 RVA: 0x00004947 File Offset: 0x00002B47
	private void OnEnable()
	{
		this.TMP_ChatInput.onSubmit.AddListener(new UnityAction<string>(this.AddToChatOutput));
	}

	// Token: 0x060000EB RID: 235 RVA: 0x00004965 File Offset: 0x00002B65
	private void OnDisable()
	{
		this.TMP_ChatInput.onSubmit.RemoveListener(new UnityAction<string>(this.AddToChatOutput));
	}

	// Token: 0x060000EC RID: 236 RVA: 0x00004984 File Offset: 0x00002B84
	private void AddToChatOutput(string newText)
	{
		this.TMP_ChatInput.text = string.Empty;
		DateTime now = DateTime.Now;
		TMP_Text tmp_ChatOutput = this.TMP_ChatOutput;
		tmp_ChatOutput.text = string.Concat(new string[]
		{
			tmp_ChatOutput.text,
			"[<#FFFF80>",
			now.Hour.ToString("d2"),
			":",
			now.Minute.ToString("d2"),
			":",
			now.Second.ToString("d2"),
			"</color>] ",
			newText,
			"\n"
		});
		this.TMP_ChatInput.ActivateInputField();
		this.ChatScrollbar.value = 0f;
	}

	// Token: 0x040000C2 RID: 194
	public TMP_InputField TMP_ChatInput;

	// Token: 0x040000C3 RID: 195
	public TMP_Text TMP_ChatOutput;

	// Token: 0x040000C4 RID: 196
	public Scrollbar ChatScrollbar;
}
