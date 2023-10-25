using System;
using UnityEngine;

// Token: 0x0200002A RID: 42
public class PlayerFlashlight : MonoBehaviour
{
	// Token: 0x060000AB RID: 171 RVA: 0x00002188 File Offset: 0x00000388
	private void Start()
	{
	}

	// Token: 0x060000AC RID: 172 RVA: 0x00004088 File Offset: 0x00002288
	private void Update()
	{
		if (Input.GetKeyDown(KeyCode.F) && !this.flashlight.enabled)
		{
			this.flashlight.enabled = true;
			return;
		}
		if (Input.GetKeyDown(KeyCode.F) && this.flashlight.enabled)
		{
			this.flashlight.enabled = false;
		}
	}

	// Token: 0x0400009B RID: 155
	public Light flashlight;
}
