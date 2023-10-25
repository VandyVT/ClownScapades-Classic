using System;
using UnityEngine;

// Token: 0x02000026 RID: 38
public class Pause : MonoBehaviour
{
	// Token: 0x06000097 RID: 151 RVA: 0x00003BA4 File Offset: 0x00001DA4
	private void Update()
	{
		if (Input.GetKeyDown(KeyCode.Escape))
		{
			this.isPaused = !this.isPaused;
		}
		if (this.isPaused)
		{
			this.ActivateMenu();
			Cursor.visible = true;
			Cursor.lockState = CursorLockMode.None;
			return;
		}
		this.DeactivateMenu();
		Cursor.visible = false;
		Cursor.lockState = CursorLockMode.Locked;
	}

	// Token: 0x06000098 RID: 152 RVA: 0x00003BF6 File Offset: 0x00001DF6
	private void ActivateMenu()
	{
		Time.timeScale = 0f;
		AudioListener.pause = true;
		this.pauseMenuUI.SetActive(true);
	}

	// Token: 0x06000099 RID: 153 RVA: 0x00003C14 File Offset: 0x00001E14
	public void DeactivateMenu()
	{
		Time.timeScale = 1f;
		AudioListener.pause = false;
		this.pauseMenuUI.SetActive(false);
		this.isPaused = false;
	}

	// Token: 0x04000089 RID: 137
	[SerializeField]
	private GameObject pauseMenuUI;

	// Token: 0x0400008A RID: 138
	[SerializeField]
	private bool isPaused;
}
