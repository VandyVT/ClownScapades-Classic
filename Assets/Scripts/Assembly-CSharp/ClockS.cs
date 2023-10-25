using System;
using UnityEngine;

// Token: 0x02000013 RID: 19
public class ClockS : MonoBehaviour
{
	// Token: 0x0600004D RID: 77 RVA: 0x00002EA4 File Offset: 0x000010A4
	private void Update()
	{
		string a = DateTime.UtcNow.ToString("ss");
		if (a != this.oldSeconds)
		{
			this.UpdateTimer();
		}
		this.oldSeconds = a;
	}

	// Token: 0x0600004E RID: 78 RVA: 0x00002EE0 File Offset: 0x000010E0
	private void UpdateTimer()
	{
		base.GetComponent<AudioSource>().Play();
		int num = int.Parse(DateTime.UtcNow.ToLocalTime().ToString("ss"));
		int num2 = int.Parse(DateTime.UtcNow.ToLocalTime().ToString("mm"));
		int num3 = int.Parse(DateTime.UtcNow.ToLocalTime().ToString("hh"));
		iTween.RotateTo(this.SecsTongue, iTween.Hash(new object[]
		{
			"z",
			num * 6 - 1,
			"time",
			1,
			"easetype",
			"easeOutQuint"
		}));
		iTween.RotateTo(this.MinTongue, iTween.Hash(new object[]
		{
			"z",
			num2 * 6 - 1,
			"time",
			1,
			"easetype",
			"easeOutElastic"
		}));
		float num4 = (float)num3 / 60f;
		iTween.RotateTo(this.HourTongue, iTween.Hash(new object[]
		{
			"z",
			((float)num3 + num4) * 360f / 12f * -1f,
			"time",
			1,
			"easetype",
			"easeOutElastic"
		}));
	}

	// Token: 0x04000051 RID: 81
	public GameObject SecsTongue;

	// Token: 0x04000052 RID: 82
	public GameObject HourTongue;

	// Token: 0x04000053 RID: 83
	public GameObject MinTongue;

	// Token: 0x04000054 RID: 84
	private string oldSeconds;
}
